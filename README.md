# ivim - An easy & highly customizable vim configuration 

```
    _       _          
   (_)   __(_)___ ___  
  / / | / / / __ `__ \ 
 / /| |/ / / / / / / / 
/_/ |___/_/_/ /_/ /_/  
```

**Version: 2.0 beta**

## Features

***Beautiful***

![snapshot](https://raw.githubusercontent.com/kepbod/ivim/master/snapshot.jpg)

 * Use lots of famous colorschemes to make your eyes feel comfortable in both Vim and MacVim/gVim.

    * [Hybrid](https://github.com/w0ng/vim-hybrid)(default)
    * [Solarized](https://github.com/altercation/vim-colors-solarized)
    * [Base16](https://github.com/chriskempson/base16-vim)

***Efficient***

 * Make using Vim more convenient and faster, and lots of useful plugins (such as [Neocomplcache](https://github.com/Shougo/neocomplcache), [NERD_commenter](https://github.com/scrooloose/nerdcommenter), [Syntastic](https://github.com/scrooloose/syntastic)) confirm a better performance of Vim.

 * To view the full plugin list, please consult [here](https://github.com/kepbod/ivim/blob/master/vimrc#L132)

## Requirements

**Vim**

 * This distribution is adapted to both [Vim](http://www.vim.org/download.php) and [MacVim](http://www.vim.org/download.php#mac)/[gVim](http://www.vim.org/download.php#pc). Remember that the Vim/MacVim/gVim version should be 7.3+, or errors would occur!

**Git**

 * All the installations are based on [Git](http://git-scm.com/) which is a famous distributed revision control system. If you use Windows, you may need install [msysgit](http://msysgit.github.com//).

**Ctags**

 * Ctags generates an index (or tag) file of language objects found in source files that allows these items to be quickly and easily located by a text editor or other utility. I recommend you to use [Exuberant Ctags](http://ctags.sourceforge.net/).

*To use this distribution with less bugs, please get more suggestions from [here](https://github.com/kepbod/ivim/wiki/Tips-for-ivim)*

## Installation

### Manual Installation

0. A Vim/MacVim/gVim with version higher than 7.3 should be installed on your computer;
1. Get ivim from github website, `git clone git://github.com/kepbod/ivim.git $HOME/ivim`;
2. Make symbolic links of vimrc to your home directory, `ln -s $HOME/ivim/vimrc $HOME/.vimrc`;
3. Install NeoBundle to install and update plugins, `git clone git://github.com/Shougo/neobundle.vim.git $HOME/.vim/bundle/neobundle.vim`;
4. Install plugins, `$HOME/.vim/bundle/neobundle.vim/bin/neoinstall > /dev/null 2>&1` for *nix or `$HOME/.vim/bundle/neobundle.vim/bin/neoinstall.bat` for windows;
5. Just enjoy it!

### Automatic Installation (*nix only)

**via 'curl'**

```bash
bash <(curl -L https://raw.githubusercontent.com/kepbod/ivim/master/setup.sh) -i
```

**via 'wget'**

```bash
bash <(wget --no-check-certificate https://raw.githubusercontent.com/kepbod/ivim/master/setup.sh -O -) -i
```

## Updating

```bash
bash $HOME/ivim/setup.sh -n
```

## Configuration

There are some options you could set through `.vimrc` to configure ivim:
* g:ivim_user -- your username
* g:ivim_email -- your email
* g:ivim_github -- your github
* g:ivim_fancy_font -- using fancy font or not
* g:ivim_show_number -- showing number or not
* g:ivim_bundle_groups -- plugin groups

*This distribution is completely customisable using a `~/.vimrc.local`, `~/.gvimrc.local` and `~/.vimrc.bundles.local`!*

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

## License

Copyright (C) 2012-2014 Xiao-Ou Zhang and contributors. See the [LICENSE](https://github.com/kepbod/ivim/blob/master/LICENSE.txt) file for license rights and limitations (MIT)
