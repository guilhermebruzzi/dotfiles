# install plugins

if [ ! -d ./zsh/custom/plugins ]; then
	mkdir ./zsh/custom/plugins
fi

rm -rf ./zsh/custom/plugins/zsh-auto-completions
git clone https://github.com/zsh-users/zsh-completions.git ./zsh/custom/plugins/zsh-completions

rm -rf ./zsh/custom/plugins/zsh-auto-virtualenv
git clone https://github.com/tek/zsh-auto-virtualenv.git ./zsh/custom/plugins/zsh-auto-virtualenv

rm -rf ./zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git ./zsh/custom/plugins/zsh-autosuggestions

rm -rf ./zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ./zsh/custom/plugins/zsh-syntax-highlighting