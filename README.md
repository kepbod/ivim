# ivim - An easy & highly customizable vim configuration 

```
    _       _          
   (_)   __(_)___ ___  
  / / | / / / __ `__ \ 
 / /| |/ / / / / / / / 
/_/ |___/_/_/ /_/ /_/  
```

**Version: 3.0**

After about 5 years' development, ivim contains 2 versions to satisfy different requirements.

* [ivim](https://github.com/kepbod/ivim/blob/master/vimrc): highly customizable vim configuration, and it has more [colorschemes](https://github.com/kepbod/ivim/wiki/Colorscheme) and [settings](https://github.com/kepbod/ivim/wiki/Customization).
* [ivim_mini](https://github.com/kepbod/ivim/blob/master/vimrc_mini): vim configuration with fast startup time and convenient usage, compatible with Vim 8.0+ and NeoVim.

If you love ivim, welcome to [buy me a cup of coffee :coffee:](https://www.paypal.me/kepbod). Thx!!!

## Features

***Beautiful***

Use lots of famous colorschemes to make your eyes feel comfortable in both Vim and NeoVim.

* ivim 

![ivim](https://raw.githubusercontent.com/kepbod/ivim/master/snapshot/ivim.jpeg)

Colorscheme: [Hybrid](https://github.com/kristijanhusak/vim-hybrid-material)

* ivim_mini

![ivim_mini](https://raw.githubusercontent.com/kepbod/ivim/master/snapshot/ivim_mini.jpeg)

Colorscheme: [Nord](https://github.com/arcticicestudio/nord-vim)

**You could install the patched font from [nerd-fonts](https://github.com/ryanoasis/nerd-fonts) (Example to install patched font in Mac could be found [here](https://gist.github.com/kepbod/f4469e3b63acb9657be5d78c6f5498d0)).**

***Efficient***

 * Make using Vim more convenient and faster, and lots of useful plugins confirm a better performance of Vim.

***Plugin List***

- **UI Setting**
  - [kristijanhusak/vim-hybrid-material](https://github.com/kristijanhusak/vim-hybrid-material) - Colorscheme hybrid material
  - [morhetz/gruvbox](https://github.com/morhetz/gruvbox) - Colorscheme gruvbox
  - [jacoborus/tender.vim](https://github.com/jacoborus/tender.vim) - Colorscheme tender
  - [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline) - Status line
  - [vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes) - Status line themes
  - [Yggdroot/indentLine](https://github.com/Yggdroot/indentLine) - Indentation level
  - [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons) - Devicons
  - [bling/vim-bufferline](https://github.com/bling/vim-bufferline) - Buffer line
  - [mhinz/vim-startify](https://github.com/mhinz/vim-startify) - Start page
  - [junegunn/goyo.vim](https://github.com/junegunn/goyo.vim) - Distraction-free
  - [junegunn/limelight.vim](https://github.com/junegunn/limelight.vim) - Hyperfocus-writing

- **Enhancement**
  - [Raimondi/delimitMate](https://github.com/Raimondi/delimitMate) - Closing of quotes
  - [tomtom/tcomment_vim](https://github.com/tomtom/tcomment_vim) - Commenter
  - [tpope/vim-abolish](https://github.com/tpope/vim-abolish) - Abolish
  - [tpope/vim-speeddating](https://github.com/tpope/vim-speeddating) - Speed dating
  - [tpope/vim-repeat](https://github.com/tpope/vim-repeat) - Repeat
  - [terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) - Multiple cursors
  - [junegunn/vim-slash](https://github.com/junegunn/vim-slash) - In-buffer search
  - [mbbill/undotree](https://github.com/mbbill/undotree) - Undo tree
  - [tpope/vim-surround](https://github.com/tpope/vim-surround) - Surround
  - [junegunn/vim-easy-align](https://github.com/junegunn/vim-easy-align) - Easy align
  - [ludovicchabant/vim-gutentags](https://github.com/ludovicchabant/vim-gutentags) - Manage tag files
  - [AndrewRadev/splitjoin.vim](https://github.com/AndrewRadev/splitjoin.vim) - Splitjoin
  - [sickill/vim-pasta](https://github.com/sickill/vim-pasta) - Vim pasta
  - [Keithbsmiley/investigate.vim](https://github.com/Keithbsmiley/investigate.vim) - Helper
  - [wikitopian/hardmode](https://github.com/wikitopian/hardmode) - Hard mode
  - [wellle/targets.vim](https://github.com/wellle/targets.vim) - Text objects
  - [roman/golden-ratio](https://github.com/roman/golden-ratio) - Resize windows
  - [chrisbra/vim-diff-enhanced](https://github.com/chrisbra/vim-diff-enhanced) - Create better diffs

- **Moving**
  - [tpope/vim-unimpaired](https://github.com/tpope/vim-unimpaired) - Pairs of mappings
  - [Lokaltog/vim-easymotion](https://github.com/Lokaltog/vim-easymotion) - Easy motion
  - [kepbod/quick-scope](https://github.com/kepbod/quick-scope) - Quick scope
  - [yuttie/comfortable-motion.vim](https://github.com/yuttie/comfortable-motion.vim) - Comfortable motion
  - [bkad/CamelCaseMotion](https://github.com/bkad/CamelCaseMotion) - Camel case motion
  - [majutsushi/tagbar](https://github.com/majutsushi/tagbar) - Tag bar
  - [junegunn/fzf](https://github.com/junegunn/fzf) - Fuzzy finder
  - [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim) - Fuzzy finder plugin

- **Navigation**
  - [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree) - NERD tree
  - [Xuyuanp/nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin) - NERD tree git plugin
  - [mhinz/vim-tmuxify](https://github.com/mhinz/vim-tmuxify) - Tmux panes

- **Completion**
  - Under NEO
    - [Shougo/neocomplete.vim](https://github.com/Shougo/neocomplete.vim) - Auto completion framework with Lua
    - [Shougo/neocomplcache.vim](https://github.com/Shougo/neocomplcache.vim) - Auto completion framework without Lua
    - [Shougo/neosnippet.vim](https://github.com/Shougo/neosnippet.vim) - Snippet engine
    - [Shougo/neosnippet-snippets](https://github.com/Shougo/neosnippet-snippets) - Snippets
    - [Shougo/vimproc.vim](https://github.com/Shougo/vimproc.vim) - Interactive command execution
    - [wellle/tmux-complete.vim](https://github.com/wellle/tmux-complete.vim) - Completion for tmux panes
  - Under YouCompleteMe
    - [Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe) -Auto completion framework
    - [honza/vim-snippets](https://github.com/honza/vim-snippets) - Snippets
    - [sirver/ultisnips](https://github.com/sirver/ultisnips) - Snippet engine

- **Compiling**
  - [scrooloose/syntastic](https://github.com/scrooloose/syntastic) - Syntax checking
  - [xuhdev/SingleCompile](https://github.com/xuhdev/SingleCompile) - Single compile

- **Git**
  - [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) - Git wrapper
  - [junegunn/gv.vim](https://github.com/junegunn/gv.vim) - A git commit browser
  - [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter) - Git diff sign

- **Language Specificity**
  - [davidhalter/jedi-vim](https://github.com/davidhalter/jedi-vim) - Python jedi plugin
  - [fatih/vim-go](https://github.com/fatih/vim-go) - Golang
  - [tpope/vim-rails](https://github.com/tpope/vim-rails) - Rails
  - [mattn/emmet-vim](https://github.com/mattn/emmet-vim) - Emmet
  - [LaTeX-Box-Team/LaTeX-Box](https://github.com/LaTeX-Box-Team/LaTeX-Box) - LaTex
  - [sheerun/vim-polyglot](https://github.com/sheerun/vim-polyglot) - Language Support

## Requirements

**Vim**

 * This distribution is adapted to both [Vim](http://www.vim.org/download.php) and [NeoVim](https://neovim.io). For Vim, version should be 7.3+, and 8.0+ is recommended. For NeoVim, 0.1.5+ is recommended.

**Git**

 * All the installations are based on [Git](http://git-scm.com/) which is a famous distributed revision control system. If you use Windows, you may need install [msysgit](http://msysgit.github.com//).

**Ctags**

 * Ctags generates an index (or tag) file of language objects found in source files that allows these items to be quickly and easily located by a text editor or other utility. I recommend you to use [Exuberant Ctags](http://ctags.sourceforge.net/).

*To use this distribution with less bugs, please get more suggestions from [here](https://github.com/kepbod/ivim/wiki/Tips-for-ivim).*

## Installation

* [ivim](https://github.com/kepbod/ivim/blob/master/vimrc)

```bash
bash <(curl -L https://raw.githubusercontent.com/kepbod/ivim/master/setup.sh) -i
# or
bash <(wget --no-check-certificate https://raw.githubusercontent.com/kepbod/ivim/master/setup.sh -O -) -i
```

* [ivim_mini](https://github.com/kepbod/ivim/blob/master/vimrc_mini) for vim

```bash
bash <(curl -L https://raw.githubusercontent.com/kepbod/ivim/master/setup.sh) -m
# or
bash <(wget --no-check-certificate https://raw.githubusercontent.com/kepbod/ivim/master/setup.sh -O -) -m
```

* [ivim_mini](https://github.com/kepbod/ivim/blob/master/vimrc_mini) for neovim

```bash
bash <(curl -L https://raw.githubusercontent.com/kepbod/ivim/master/setup.sh) -u
# or
bash <(wget --no-check-certificate https://raw.githubusercontent.com/kepbod/ivim/master/setup.sh -O -) -u
```

## Updating

```bash
bash $HOME/.ivim/setup.sh -n
```

## Configuration

* This distribution is completely customisable using `~/.vimrc.ivim.local`, `~/.vimrc.local`, `~/.gvimrc.local` and `~/.vimrc.bundles.local`! (only for `vimrc`)
* To make full use of auto-completion and syntax checking, please refer [wiki](https://github.com/kepbod/ivim/wiki/Auto-completion-and-syntax-checking).


## Contributation

Welcome to contribute to ivim, see [issue #31](https://github.com/kepbod/ivim/issues/31) for details. Thank you very much for your supporting!

## Vim Tips

*Learning Vim*

* A good learning method of Vim is vimtutor, a 30 minute tutorial that teaches the most basic Vim functionality hands-on.

    To try it, just type `vimtutor` on terminal.

* To practice vim skills, you can enable hard mode, and it will disable the arrow keys, the 'hjkl' keys, the page up/down keys, and a handful of other keys which allow one to rely on character-wise navigation.

    To enable it, just type `:call HardMode()` in normal mode.

* Another way to get familiar with Vim commands and settings is just rely on the strong help system of Vim.

    It's easy and convenient to type `:h` or `:help` in Vim for help of whatever you want to know.

* A beautiful Vim cheat sheet is available [here](http://michael.peopleofhonoronly.com/vim/). If you want one, just click it!

*Key Mappings*

* Because I have set some key mappings for more convenient typing and checking, you may feel inconvenient with them at start. But if you get familiar with them, I'm sure you will love them.

    You can just type `:map` in Vim to see them.

*More Tips*

* [Vim_Tips_Wiki](http://vim.wikia.com/wiki/Vim_Tips_Wiki) is an excellent website, and you can learn much from it.
* [Vimcasts](http://vimcasts.org) publishes free screencasts about Vim. It's useful and interesting! Believe me!

**Hope You Enjoy Vimming!!!**

## License

Copyright (C) 2012-2018 Xiao-Ou Zhang. See the [LICENSE](https://github.com/kepbod/ivim/blob/master/LICENSE.txt) file for license rights and limitations (MIT).
