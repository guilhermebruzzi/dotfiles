#!/usr/bin/env bash

set -euo pipefail

# Restore Cursor settings and extensions from this repo backup.
# macOS only: restores into "$HOME/Library/Application Support/Cursor".
#
# What it does:
# - Quits Cursor if running
# - Backs up current local Cursor User config into repo at cursor/_local-backups/<timestamp>
# - Restores repo backup from cursor/cursor-ba/User into local User directory (rsync --delete)
# - Reinstalls extensions from cursor/cursor-extensions.txt if Cursor CLI is available
#
# Usage:
#   ./install.sh            # run restore
#   ./install.sh --no-ext   # restore settings only (skip extensions)
#   ./install.sh --force    # skip interactive confirmation
#
# Notes:
# - Only the User directory is restored (settings, keybindings, snippets, profiles).
# - Caches and blob data in backup are intentionally not restored.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_ROOT="$SCRIPT_DIR/cursor-ba"
BACKUP_USER_DIR="$BACKUP_ROOT/User"
EXT_LIST_FILE="$SCRIPT_DIR/cursor-extensions.txt"
LOCAL_APP_SUPPORT="$HOME/Library/Application Support/Cursor"
LOCAL_USER_DIR="$LOCAL_APP_SUPPORT/User"
LOCAL_BACKUPS_DIR="$SCRIPT_DIR/_local-backups"

INSTALL_EXT=true
FORCE=false

for arg in "$@"; do
  case "$arg" in
    --no-ext)
      INSTALL_EXT=false
      shift
      ;;
    --force)
      FORCE=true
      shift
      ;;
    *)
      ;;
  esac
done

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This restore script currently supports macOS only." >&2
  exit 1
fi

if [[ ! -d "$BACKUP_USER_DIR" ]]; then
  echo "Backup not found: $BACKUP_USER_DIR" >&2
  exit 1
fi

mkdir -p "$LOCAL_APP_SUPPORT"
mkdir -p "$LOCAL_BACKUPS_DIR"

quit_cursor() {
  # Try graceful quit
  if pgrep -f "/Applications/Cursor.app" >/dev/null 2>&1 || pgrep -x "Cursor" >/dev/null 2>&1; then
    osascript -e 'tell application "Cursor" to quit' >/dev/null 2>&1 || true
    # Fallback to kill after a short wait
    sleep 1
    if pgrep -x "Cursor" >/dev/null 2>&1; then
      pkill -x "Cursor" || true
    fi
  fi
}

confirm() {
  if $FORCE; then
    return 0
  fi
  read -r -p "This will overwrite your local Cursor User settings. Continue? [y/N] " ans || true
  case "$ans" in
    y|Y|yes|YES)
      return 0
      ;;
    *)
      echo "Aborted."
      exit 1
      ;;
  esac
}

rsync_copy() {
  local src="$1"
  local dst="$2"
  rsync -a --delete --human-readable --info=stats1,progress2 \
    --exclude "globalStorage/***" \
    --exclude "workspaceStorage/***" \
    "$src/" "$dst/"
}

backup_local_user() {
  if [[ -d "$LOCAL_USER_DIR" ]]; then
    local ts
    ts="$(date +%Y-%m-%d_%H-%M-%S)"
    local dest="$LOCAL_BACKUPS_DIR/$ts-User"
    echo "Backing up current local User settings to: $dest"
    mkdir -p "$dest"
    rsync -a --human-readable "$LOCAL_USER_DIR/" "$dest/"
  else
    echo "No existing local User directory to backup." 
  fi
}

install_extensions() {
  if ! $INSTALL_EXT; then
    echo "Skipping extension installation (--no-ext)."
    return 0
  fi

  if [[ ! -f "$EXT_LIST_FILE" ]]; then
    echo "Extension list not found: $EXT_LIST_FILE (skipping)"
    return 0
  fi

  local CLI=""
  if command -v cursor >/dev/null 2>&1; then
    CLI="cursor"
  elif command -v code >/dev/null 2>&1; then
    # Fallback to VS Code CLI if Cursor CLI not found
    CLI="code"
  fi

  if [[ -z "$CLI" ]]; then
    echo "Neither 'cursor' nor 'code' CLI found in PATH. Skipping extension install."
    return 0
  fi

  echo "Installing extensions from: $EXT_LIST_FILE using $CLI"
  # Filter comments and blank lines
  grep -v -E '^(#|\s*$)' "$EXT_LIST_FILE" | while read -r ext; do
    if [[ -n "$ext" ]]; then
      echo "-> $ext"
      "$CLI" --install-extension "$ext" || echo "Failed to install $ext (continuing)"
    fi
  done
}

main() {
  echo "Restoring Cursor backup..."
  echo "Source: $BACKUP_USER_DIR"
  echo "Target: $LOCAL_USER_DIR"

  confirm
  quit_cursor
  backup_local_user

  echo "Restoring User settings..."
  mkdir -p "$LOCAL_USER_DIR"
  rsync_copy "$BACKUP_USER_DIR" "$LOCAL_USER_DIR"

  install_extensions

  echo "Done. You can reopen Cursor now."
}

main "$@"
