#!/usr/bin/env bash

warn ()
{
    printf '\033[0;31m%s\033[0m\n' "$1" >&2
}

die ()
{
    warn "$1"
    exit 1
}
printf '\033[0;34m%s\033[0m\n' "Thanks for installing ivim!"
printf '\033[0;34m%s\033[0m\n' '    _       _         '
printf '\033[0;34m%s\033[0m\n' '   (_)   __(_)___ ___ '
printf '\033[0;34m%s\033[0m\n' '  / / | / / / __ `__ \'
printf '\033[0;34m%s\033[0m\n' ' / /| |/ / / / / / / /'
printf '\033[0;34m%s\033[0m\n' '/_/ |___/_/_/ /_/ /_/ '
printf '\033[0;34m%s\033[0m\n' '                      '
                      
# check requriements
printf '\033[0;34m%s\033[0m\n' "Checking requriements for ivim..."
printf '\033[0;34m%s\033[0m\n' "Checking vim version..."
vim --version | grep 7.3 || die "Your vim's version is too low!\nPlease download higher version(7.3+) from http://www.vim.org/download.php"
printf '\033[0;34m%s\033[0m\n' "Checking if git exists..."
which git || die "No git installed!\nPlease install git from http://git-scm.com/downloads/"
printf '\033[0;34m%s\033[0m\n' "Check if ctags exists..."
which ctags || warn "No ctags installed!\nPlease install ctags form http://ctags.sourceforge.net/ after ivim intallation!"

# back up existing vim stuff
printf '\033[0;34m%s\033[0m\n' "Backing up current vim config..."
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do [ -e $i ] && mv -f $i $i.backup; done

# install ivim
printf '\033[0;34m%s\033[0m\n' "Cloning ivim..."
rm -rf $HOME/ivim
git clone git://github.com/kepbod/ivim.git $HOME/ivim
ln -s $HOME/ivim/vimrc $HOME/.vimrc

printf '\033[0;34m%s\033[0m\n' "Installing Vundle..."
git clone git://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

printf '\033[0;34m%s\033[0m\n' "Installing hybrid theme..."
git clone git://github.com/w0ng/vim-hybrid.git $HOME/.vim/bundle/vim-hybrid

printf '\033[0;34m%s\033[0m\n' "Installing plugins using Vundle..."
vim +'set nospell' +BundleInstall! +BundleClean! +qa! $HOME/ivim/tools/info.txt

printf '\033[0;34m%s\033[0m\n' "ivim has been installed. Just enjoy vimming!"
