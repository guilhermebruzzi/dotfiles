alias zshconfig="atom ~/.zshrc"
alias ohmyzsh="atom ~/.oh-my-zsh"
alias dotfiles="cd ~/.dotfiles"

alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

alias myip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\   -f2  | awk "NR==1{print $1}"'

alias ipip='pip install -i http://artifactory.globoi.com/artifactory/api/pypi/pypi-all/simple --trusted-host artifactory.globoi.com'

alias flushdns='dscacheutil -flushcache'

alias mongodb='sudo mongod'

export DYLD_LIBRARY_PATH=/usr/local/Cellar/mysql56/5.6.27/lib
# export DYLD_LIBRARY_PATH=/usr/local/Cellar/mysql/5.7.9/lib

alias ipypilocal-send='python ./setup.py sdist upload -r ipypi-local'

alias mkve27='mkvirtualenv --no-site-packages --python=/usr/bin/python2.7'
alias mkve33='mkvirtualenv --no-site-packages --python=/usr/local/bin/python3.3'
alias mkve34='mkvirtualenv --no-site-packages --python=/usr/local/bin/python3.4'

alias setup='pip install -e . --no-deps'

alias simplehttpserver='python -m SimpleHTTPServer 8080'

#projetos
alias bsnapp='cd ~/projetos/globo-apps/bsn-app-home/'
alias cdn='workon framework-navegacao-cdn; cd ~/projetos/framework-navegacao-cdn/'
