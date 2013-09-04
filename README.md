# ivim - The Vim Distribution of Xiao-Ou Zhang

[![Vim](http://www.vim.org/images/vim_editor.gif)](http://www.vim.org/)

[See ivim's states on GitEgo](http://gitego.com/kepbod/ivim#watchers?interval=by_day)

## Installation

### Manual Install

0. A Vim/MacVim/gVim with version higher than 7.3 has been installed on your computer, and back up your origin vim stuff;
1. Install Vundle to install and update plugins, `git clone git://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle`;
2. Install hybrid theme, `git clone git://github.com/w0ng/vim-hybrid.git $HOME/.vim/bundle/vim-hybrid`;
3. Get ivim from github website, `git clone git://github.com/kepbod/ivim.git $HOME/ivim`;
4. Make symbolic links of vimrc to your home directory, `ln -s $HOME/ivim/vimrc $HOME/.vimrc`;
5. Install plugins, `vim +BundleInstall! +BundleClean! +qa!`;
6. Just enjoy it!

### Automatic Install (*nix only)

**via 'curl'**

```bash
curl -L https://raw.github.com/kepbod/ivim/master/tools/bootstrap.sh | bash
```

**via 'wget'**

```bash
wget --no-check-certificate https://raw.github.com/kepbod/ivim/master/tools/bootstrap.sh -O - | bash
```

## Updating

```bash
bash $HOME/ivim/tools/update.sh
```

*If you confront errors when you update vim plugins, please run command below.*

```bash
bash $HOME/ivim/tools/restore.sh
```

## Requirements

**Vim**

 * This distribution is adapted to both [Vim](http://www.vim.org/download.php) and [MacVim](http://www.vim.org/download.php#mac)/[gVim](http://www.vim.org/download.php#pc). Remember that the Vim/MacVim/gVim version should be 7.3+, or errors would occur!

**Git**

 * All the installations are based on [Git](http://git-scm.com/) which is a famous distributed revision control system. If you use Windows, you may need install [msysgit](http://msysgit.github.com//).

**Ctags**

 * Ctags generates an index (or tag) file of language objects found in source files that allows these items to be quickly and easily located by a text editor or other utility. I recommend you to use [Exuberant Ctags](http://ctags.sourceforge.net/).

*To use this distribution with less bugs, please get more suggestions from [here](https://github.com/kepbod/ivim/wiki/Tips-for-ivim)*

## Features

***Beautiful***

 * Use lots of famous colorschemes to make your eyes feel comfortable in both Vim and MacVim/gVim.

    * [Hybrid](https://github.com/w0ng/vim-hybrid)(default)
    * [Tomorrow-Night](https://github.com/chriskempson/tomorrow-theme)
    * [Solarized](https://github.com/altercation/vim-colors-solarized)
    * [Jellybeans](https://github.com/nanotech/jellybeans.vim)

 ![screenshot](https://lh6.googleusercontent.com/-e-CWpdeh7GA/UJuyYagHmDI/AAAAAAAAAHU/k4hYnUHv2xg/s910/Tooltip_005.png)

***Efficient***

 * Make using Vim more convenient and faster, and lots of useful plugins (such as [Neocomplcache](https://github.com/Shougo/neocomplcache), [NERD_commenter](https://github.com/scrooloose/nerdcommenter), [Syntastic](https://github.com/scrooloose/syntastic) and [SingleCompile](https://github.com/xuhdev/SingleCompile)) confirm a better performance of Vim.

*This distribution is completely customisable using a `~/.vimrc.local`, `~/.gvimrc.local` and `~/.vimrc.bundles.local`!*

## Plugin List

 * [Vundle](https://github.com/gmarik/vundle) - Manage the Vim scripts
 * [Tagbar](https://github.com/majutsushi/tagbar) - Browse the tags of source code files
 * [NERD_tree](https://github.com/scrooloose/nerdtree) - Explore filesystem and to open files and directories
 * [NERD_commenter](https://github.com/scrooloose/nerdcommenter) - Provide many different commenting operations and styles
 * [Neocomplcache](https://github.com/Shougo/neocomplcache) - Performs keyword completion by maintaining a cache of keywords
 * [surround](https://github.com/tpope/vim-surround) - Provide mappings to delete, change and add surroundings in pairs
 * [delimitMate](https://github.com/Raimondi/delimitMate) - Provides automatic closing of quotes, parenthesis, brackets, etc.
 * [Ag](https://github.com/rking/ag.vim) - A front for ag, A.K.A. the_silver_searcher
 * [Ack](https://github.com/mileszs/ack.vim) - A replacement for 'grep' using Perl module App::Ack
 * [Tabular](https://github.com/nathanaelkane/vim-indent-guides) - Line up text easily
 * [Syntastic](https://github.com/scrooloose/syntastic) - Syntax check that runs files through external syntax checkers
 * [EasyMotion](https://github.com/Lokaltog/vim-easymotion) - Provide a much simpler way to use some motions in Vim
 * [Indent Guides](https://github.com/mutewinter/vim-indent-guides) - Visually display indent levels in Vim
 * [fugitive](https://github.com/tpope/vim-fugitive) - Git wrapper
 * [Gundo](https://github.com/sjl/gundo.vim) - Visualize Vim undo tree
 * [EasyTags](https://github.com/xolox/vim-easytags) - Automated tag generation and syntax highlighting in Vim
 * [Powerline](https://github.com/Lokaltog/powerline) - Create better-looking, more functional Vim statuslines
 * [SingleCompile](https://github.com/xuhdev/SingleCompile) - Compile or run a single source file without leaving Vim
 * [CamelCaseMotion](https://github.com/bkad/CamelCaseMotion) - Refine words motion in Vim
 * [Emmet](https://github.com/mattn/emmet-vim) - High-speed HTML, XML, XSL coding and editing
 * [Splitjoin](https://github.com/AndrewRadev/splitjoin.vim) - Switch between a single-line statement and a multi-line one
 * [Unite](https://github.com/Shougo/unite.vim) - Search and display information from arbitrary sources
 * [rails.vim](https://github.com/tpope/vim-rails) - Plugin for working with Ruby on Rails applications
 * [Indent Object](https://github.com/michaeljsmith/vim-indent-object) - Text objects based on indent levels
 * [NrrwRgn](https://github.com/chrisbra/NrrwRgn) - Focus on a region and making the rest inaccessible
 * [unimpaired.vim](https://github.com/tpope/vim-unimpaired) - Complementary pairs of mappings
 * [abolish.vim](https://github.com/tpope/vim-abolish) - Search for, substitute, and abbreviate multiple variants of a word
 * [vimux](https://github.com/benmills/vimux) - Easily interact with tmux from vim
 * [markdown-preview](https://github.com/swaroopch/vim-markdown-preview) - Select Markdown text, render to HTML and preview in browser
 * [unite-outline](https://github.com/h1mesuke/unite-outline) - Provide your Vim's buffer with the outline view
 * [swap-parameters](https://github.com/mutewinter/swap-parameters) - Swap parameters
 * [autolink.vim](https://github.com/sampsyo/autolink.vim) - Find and insert URLs for links in Markdown and ReST documents
 * [textobj-word-column.txt](https://github.com/coderifous/textobj-word-column.vim) - Make operating on columns of code conceptually simpler and reduces keystrokes
 * [vim-speeddating](https://github.com/tpope/vim-speeddating) Use CTRL-A/CTRL-X to increment dates, times, and more
 * [GoldenView.vim](https://github.com/zhaocai/GoldenView.Vim) Manage windows more convenient
 * [vim-startify](https://github.com/mhinz/vim-startify) Provide a good start screen for vim
 * [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) Provide Sublime Text's awesome multiple selection feature to vim
 * [vim-matchit](https://github.com/tsaleh/vim-matchit) Extend matching with "%"
 * [vim-gitgutter](https://github.com/airblade/vim-gitgutter) Show a git diff in the 'gutter' (sign column)

**Each plugin has its unique requirements and configurations, so if you have any questions with them, please check help files of them first!**

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

**Hope You Enjoy Vimming**

## Notes

**This distribution refers to many other famous Vim configurations (mainly contain [spf13-vim](https://github.com/spf13/spf13-vim), [Champions' Configuration](https://github.com/mutewinter/dot_vim) and [Steve's Configuration](https://github.com/sjl/dotfiles/tree/master/vim)), so there may be some unavoidable errors in it, but I'll try my best to make it work well. If you have any questions, please feel free to [post your issues and suggestions](https://github.com/kepbod/ivim/issues)! Thanks!**

## Lisence

ivim - The Vim Distribution of Xiao-Ou Zhang

Copyright (C) 2013 Xiao-Ou Zhang

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the 
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

