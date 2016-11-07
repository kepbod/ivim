# ivim - An easy & highly customizable vim configuration 

```
    _       _          
   (_)   __(_)___ ___  
  / / | / / / __ `__ \ 
 / /| |/ / / / / / / / 
/_/ |___/_/_/ /_/ /_/  
```

**Version: 3.0**

After 4 years' development, ivim contains 3 versions to satisfy different requirements.

* [ivim](https://github.com/kepbod/ivim/blob/master/vimrc): highly customizable vim configuration, and it has more [colorschemes](https://github.com/kepbod/ivim/wiki/Colorscheme) and [settings](https://github.com/kepbod/ivim/wiki/Customization).
* [ivim_mini](https://github.com/kepbod/ivim/blob/master/vimrc_mini): vim configuration with fast startup time and convenient usage, compatible with Vim 8.0 and NeoVim.


## Features

***Beautiful***

Use lots of famous colorschemes to make your eyes feel comfortable in both Vim and NeoVim.

![ivim](https://raw.githubusercontent.com/kepbod/ivim/master/snapshot/ivim.jpeg)

**You could install the patched font from [vim-devicons](https://github.com/ryanoasis/vim-devicons).**

***Efficient***

 * Make using Vim more convenient and faster, and lots of useful plugins confirm a better performance of Vim.

 * To view the full plugin list, please refer [here](https://github.com/kepbod/ivim/blob/master/vimrc#L133).

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

Copyright (C) 2012-2016 Xiao-Ou Zhang. See the [LICENSE](https://github.com/kepbod/ivim/blob/master/LICENSE.txt) file for license rights and limitations (MIT).
