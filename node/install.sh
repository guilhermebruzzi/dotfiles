asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git

asdf install nodejs latest

asdf global nodejs latest

corepack enable
corepack prepare yarn@stable --activate
asdf reshim nodejs
