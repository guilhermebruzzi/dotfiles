mkdir -p ~/Library/LaunchAgents/

ln -sfv /usr/local/opt/mysql56/*.plist ~/Library/LaunchAgents/

launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql56.plist
