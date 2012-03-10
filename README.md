# The gVim/MacVim Configuration of Xiaoou Zhang

[![Vim](http://www.vim.org/images/vim_editor.gif)](http://www.vim.org/)

## Installation

1. Install Vundle which is to install and update plugins, `git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle`;
2. Get my configuration from github website, `git clone http://github.com/kepbod/vim-config.git $HOME/vimrc`;
3. Copy my configuration to your home directory, `cp $HOME/vimrc/.vimrc $HOME/.vimrc`;
4. Open .vimrc, `vim .vimrc`;
5. Install plugins, `BundleInstall`;
6. Just enjoy it!

## Requirements

**VIM**

 * This configuration requires [MacVim](http://www.vim.org/download.php#mac) or [gVim](http://www.vim.org/download.php#pc), because there may be some errors when running vim with this configuration on terminal.

**GIT**

 * All the Installation bases on [Git](http://git-scm.com/) which is a famous distributed revision control system. If you use Windows, you may need install [msysgit](http://code.google.com/p/msysgit/).

**CTAGS**

 * Ctags generates an index (or tag) file of language objects found in source files that allows these items to be quickly and easily located by a text editor or other utility. I recommend you to use [Exuberant Ctags](http://ctags.sourceforge.net/).


## Features

***Beautiful Colorschem***

 * Use famous colorschem [Solarized](http://ethanschoonover.com/solarized) to make your eyes feel confortable.

***Efficient***

 * Make using Vim more convenient and faster, and lots of useful plugins (such as [Neocomplcache](https://github.com/Shougo/neocomplcache), [NERD_commenter](https://github.com/scrooloose/nerdcommenter), [Syntastic](https://github.com/scrooloose/syntastic) and [SingleCompile](https://github.com/xuhdev/SingleCompile)) confirm a better proformance of Vim.

## Plugin List

 * [Vundle](https://github.com/gmarik/vundle) - Manage the Vim scripts
 * [Tagbar](https://github.com/majutsushi/tagbar) - Browse the tags of source code files
 * [NERD_tree](https://github.com/scrooloose/nerdtree) - Explore filesystem and to open files and directories
 * [NERD_commenter](https://github.com/scrooloose/nerdcommenter) - Provide many different commenting operations and styles
 * [Neocomplcache](https://github.com/Shougo/neocomplcache) - Performs keyword completion by maintaining a cache of keywords
 * [snipMate](https://github.com/garbas/vim-snipmate) - Implement some of TextMate's snippets features in Vim
 * [surround](https://github.com/tpope/vim-surround) - provide mappings to delete, change and add surroundings in pairs
 * [delimitMate](https://github.com/Raimondi/delimitMate) - provides automatic closing of quotes, parenthesis, brackets, etc.
 * [Ctrlp](https://github.com/kien/ctrlp.vim) - Full path fuzzy file, buffer, mru and tag finder with an intuitive interface
 * [Ack](https://github.com/mileszs/ack.vim) - A replacement for 'grep' using Perl module App::Ack
 * [Tabular](https://github.com/godlygeek/tabular) - Line up text easily
 * [Syntastic](https://github.com/scrooloose/syntastic) - syntax check that runs files through external syntax checkers
 * [EasyMotion](https://github.com/Lokaltog/vim-easymotion) - provide a much simpler way to use some motions in Vim
 * [Indent Guides](https://github.com/mutewinter/vim-indent-guides) - visually display indent levels in Vim
 * [fugitive](https://github.com/tpope/vim-fugitive) - Git wrapper
 * [Gundo](https://github.com/sjl/gundo.vim) - visualize Vim undo tree
 * [EasyTags](https://github.com/xolox/vim-easytags) - Automated tag generation and syntax highlighting in Vim
 * [Powerline](https://github.com/Lokaltog/vim-powerline) - Create better-looking, more functional Vim statuslines
 * [SingleCompile](https://github.com/xuhdev/SingleCompile) - compile or run a single source file without leaving Vim
 * [TabMan](https://github.com/kien/tabman.vim) - provide a convenient way to navigate between tabs and windows
 * [CamelCaseMotion](https://github.com/bkad/CamelCaseMotion) - Refine words motion in Vim

**Each plugin has its unique requirements and configurations, so if you have any questions with them, please check help files of them first!**

## Vim Tips

*Learning Vim*

* A good learning method of Vim is vimtutor, a 30 minute tutorial that teaches the most basic Vim functionality hands-on.

    To try it, just type `vimtutor` on terminal.

* Another way to get familiar with Vim commands and settings is just rely on the strong help system of Vim.

    It's easy and convenient to type `:h` or `:help` in Vim for help of whatever you want to know.

*Key Map*

* Because I have set some key maps for more convenient typing and checking, you may be inconvenient with them at start. But if you get familiar with them, I'm sure you will like them.

    You can just type `:map` in Vim to see them.

*More Tips*

* [Vim_Tips_Wiki](http://vim.wikia.com/wiki/Vim_Tips_Wiki) is an excellent website, and you can learn much from it.
**Hope You Enjoy Vimmmmmming**

## Notes

**This configuration refers to many other famous Vim configurations (mainly contain [spf13-vim](https://github.com/spf13/spf13-vim), [Champions' Configuration](https://github.com/mutewinter/dot_vim) and [Steve's Configuration](https://github.com/sjl/dotfiles/tree/master/vim)), so there may be some unavoidable errors in it, but I have tried my best to make it work well. If you have any questions, please feel free to contact me! Thanks!**
