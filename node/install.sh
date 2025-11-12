mise use --global node@latest

mise use -g usage
mkdir -p ~/.local/share/bash-completion/completions/
mise completion bash --include-bash-completion-lib > ~/.local/share/bash-completion/completions/mise

npm install -g @anthropic-ai/claude-code
