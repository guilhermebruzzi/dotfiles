if test ! $(which spoof)
then
  npm install spoof babel gulp npmrc rnpm webpack-dev-server bower npm react-native-cli webpack npm-check -g
fi

if test ! $(which nvm)
then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash
fi
