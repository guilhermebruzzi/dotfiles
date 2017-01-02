if ! command -v spoof 2>/dev/null; then
  cat ./node/npm_requirements.txt | xargs npm install -g
fi

if ! command -v nvm 2>/dev/null; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash
fi
