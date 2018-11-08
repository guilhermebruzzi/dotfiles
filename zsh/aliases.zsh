alias zshconfig="atom ~/.zshrc"
alias ohmyzsh="atom ~/.oh-my-zsh"
alias dotfiles="cd ~/.dotfiles"

alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# highlight to keynote
alias highlight_to_keynote='pbpaste | highlight --syntax=js -O rtf | pbcopy'

alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

alias myip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\   -f2  | awk "NR==1{print $1}"'

alias flushgit="git checkout master && git branch --merged | egrep -v '(^\*|master|dev)' | xargs git branch -D"

alias flushdns='dscacheutil -flushcache'

alias mongodb='sudo mongod'

export DYLD_LIBRARY_PATH=/usr/local/Cellar/mysql56/5.6.27/lib
# export DYLD_LIBRARY_PATH=/usr/local/Cellar/mysql/5.7.9/lib

alias ipypilocal-send='python ./setup.py sdist upload -r ipypi-local'

alias mkve27='mkvirtualenv --no-site-packages --python=/usr/bin/python2.7'
alias mkve33='mkvirtualenv --no-site-packages --python=/usr/local/bin/python3.3'
alias mkve34='mkvirtualenv --no-site-packages --python=/usr/local/bin/python3.4'
alias mkve35='mkvirtualenv --no-site-packages --python=/usr/local/bin/python3.5'

alias setup='pip install -e . --no-deps'

alias simplehttpserver='python -m SimpleHTTPServer 8080'

alias conflicts='atom $(git diff --name-only | uniq)'

alias vtexwork='npm install -g vtex && vtex workspace reset -y && vtex config set env prod && vtex link --verbose'

alias sickrage-run='cd /Applications/SickRage && python /Applications/SickRage/SiCKRAGE.py -p 8091'
