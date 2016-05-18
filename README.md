# TheBastedo's Super Awesome Vim
Feature List:

 * Package and plugin management with [Vundle](https://github.com/gmarik/Vundle.vim)
 * Wicked awesome color scheme thanks to [Solarized](https://github.com/altercation/vim-colors-solarized)
 * Code Completion with caching [neocomplcache](https://github.com/Shougo/neocomplcache.vim)
 * File browsing with [NerdTree](https://github.com/scrooloose/nerdtree)
 * CLI Git with [Fugitive](https://github.com/tpope/vim-fugitive)
 * Fancy searching with [Easymotion](https://github.com/Lokaltog/vim-easymotion)
 * Easily work with files and filesystem using [FuzzyFinder](https://bitbucket.org/ns9tks/vim-fuzzyfinder/)
 * Filesystem searching with [command-t](https://bitbucket.org/ns9tks/vim-fuzzyfinder/)
 * HTML generation with [Emmet](http://mattn.github.io/emmet-vim/)
 * Statusline beautification with [Powerline](https://github.com/powerline/powerline)
 * Lint on write using [Syntastic](https://github.com/scrooloose/syntastic)
 * Easy to install and setup
 * GUI and CLI friendly

## Install

It's pretty easy, but pretty dumb at this point.

### Step 1
Clone the git repo into your vim folder
```bash
$ git clone https://github.com/thebastedo/vimrc.git ~/.vim
```

### Step 2
Run the setup script
```bash
$ ln -s ~/.vim/vimrc ~/.vimrc
```

### Step 3
Install a Powerline friendly font available from here: [Powerline Fonts](https://github.com/powerline/fonts)

### Step 4
Start vim and install plugins
```bash
$ vim +PluginInstall +qall
```

### Step 5 
PROFIT!
