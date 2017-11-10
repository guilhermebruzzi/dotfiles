# Load our zsh functions

fpath=( $HOME/.dotfiles/zsh/custom/functions "${fpath[@]}" )
autoload -Uz c extract gf add-zsh-hook pod
autoload -U compinit && compinit
