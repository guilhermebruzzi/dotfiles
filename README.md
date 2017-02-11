## what's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser
above and see what components may mesh up with you.
[Fork it](https://github.com/guilhermebruzzi/dotfiles/fork), remove what you don't
use, and build on what you do use.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **Brewfile**: This is a list of applications for [Homebrew Cask](http://caskroom.io) to install: things like Chrome and 1Password and Adium and stuff. Might want to edit this file before running any initial setup.
- **topic/install.zsh**: Will install the topic.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## install

Run this:

```sh
rm ~/.profile ~/.bashrc # Check any file in home that have a config
git clone https://github.com/guilhermebruzzi/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
chsh -s /bin/zsh # link new zsh shell
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

Also change the git.gitconfig.symlink file to have your data.

`dot` is a simple script that installs some dependencies, sets sane OS X
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

Rename your mac on terminal like `osx/install.sh` says.

## thanks

I forked [holman](http://github.com/holman)' excellent
[dotfiles](http://github.com/holman/dotfiles) , removed some stuff and added python, oh-my-zsh, some plugins, functions and other stuff.
