alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias dotfiles="cd ~/.dotfiles"

alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# highlight to keynote
alias highlight_to_keynote='pbpaste | highlight --syntax=js -O rtf | pbcopy'

alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

alias myip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\   -f2  | awk "NR==1{print $1}"'

alias flushgit="git checkout master && git branch --merged | egrep -v '(^\*|master|dev)' | xargs git branch -D"

alias flushdns='dscacheutil -flushcache'

alias retrigger='git commit -m "re-trigger checks" --allow-empty'

alias ghpr='gh pr create --fill -B main'

alias mongodb='sudo mongod'

# export DYLD_LIBRARY_PATH=/usr/local/Cellar/mysql56/5.6.27/lib
# export DYLD_LIBRARY_PATH=/usr/local/Cellar/mysql/5.7.9/lib

alias ipypilocal-send='python ./setup.py sdist upload -r ipypi-local'

alias mkve='mkvirtualenv --no-site-packages'
alias mkve27='mkvirtualenv --no-site-packages --python=/usr/bin/python2.7'
alias mkve33='mkvirtualenv --no-site-packages --python=/usr/local/bin/python3.3'
alias mkve34='mkvirtualenv --no-site-packages --python=/usr/local/bin/python3.4'
alias mkve35='mkvirtualenv --no-site-packages --python=/usr/local/bin/python3.5'

alias setup='pip install -e . --no-deps'

alias simplehttpserver='python -m http.server 8080' # python3+
alias simplehttpserver2='python -m SimpleHTTPServer 8080' # python 2.7+

alias conflicts='code $(git diff --name-only | uniq)'

alias y='yarn'
alias ya='yarn add'
alias yad='yarn add -D'
alias yat='npx lerna --scope=@vtexlab/gatsby-theme-instore-core add'
alias yatd='npx lerna --scope=@vtexlab/gatsby-theme-instore-core add -D'
alias yag='yarn global add'
alias ys='yarn start'
alias yse='yarn example:start'
alias yj='yarn jest'
alias yt='yarn test'
alias yw='yarn test:watch'

# Cursor as vscode
alias code='/usr/local/bin/cursor'
