# Load our zsh functions

fpath=( $HOME/.dotfiles/zsh/custom/functions "${fpath[@]}" )
autoload -Uz c extract gf add-zsh-hook pod rn-menu cleanup_branches create_staging delete_remote_old_tags
autoload -U compinit && compinit
