# install plugins
if [ ! -d ./zsh/custom/plugins/zsh-completions ]; then
  git clone https://github.com/zsh-users/zsh-completions.git ./zsh/custom/plugins/zsh-completions
fi

if [ ! -d ./zsh/custom/plugins/zsh-auto-virtualenv ]; then
  git clone https://github.com/tek/zsh-auto-virtualenv.git ./zsh/custom/plugins/zsh-auto-virtualenv
fi

if [ ! -d ./zsh/custom/plugins/zsh-autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ./zsh/custom/plugins/zsh-autosuggestions
fi

if [ ! -d ./zsh/custom/plugins/zsh-syntax-highlighting ]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ./zsh/custom/plugins/zsh-syntax-highlighting
fi