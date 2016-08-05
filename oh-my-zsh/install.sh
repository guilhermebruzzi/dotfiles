sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -sf "$HOME/.dotfiles/zsh/zshrc.symlink" "$HOME/.zshrc" # relink to our zshrc
