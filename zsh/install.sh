# install plugins
if [ ! -d ./zsh/custom/plugins/zsh-completions ]; then
  git clone https://github.com/zsh-users/zsh-completions.git ./zsh/custom/plugins/zsh-completions
fi

if [ ! -d ./zsh/custom/plugins/zsh-auto-virtualenv ]; then
  git clone https://github.com/tek/zsh-auto-virtualenv.git ./zsh/custom/plugins/zsh-auto-virtualenv
fi
