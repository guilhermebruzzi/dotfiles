if [ ! -d "/tmp/powerline-fonts" ]; then
  cd /tmp/ && git clone git@github.com:powerline/fonts.git powerline-fonts
  cd /tmp/powerline-fonts/ && ./install.sh
fi
