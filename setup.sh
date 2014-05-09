#!/usr/bin/env bash

help() {
    echo "setup.sh -- setup ivim"
    echo "Usage: setup.sh -i/-n"
    echo "-i -- install ivim"
    echo "-n -- update ivim"
    exit 0
}

color_print() {
    printf '\033[0;31m%s\033[0m\n' "$1"
}

warn() {
    color_print "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

logo() {
    color_print "Thank you for installing ivim!"
    color_print '    _       _         '
    color_print '   (_)   __(_)___ ___ '
    color_print '  / / | / / / __ `__ \'
    color_print ' / /| |/ / / / / / / /'
    color_print '/_/ |___/_/_/ /_/ /_/ '
    color_print '                      '
}

require() {
    color_print "Checking requirements for ivim..."
    color_print "Checking vim version..."
    vim --version | grep 7.[3-9] || die "Your vim's version is too low!\nPlease download higher version(7.3+) from http://www.vim.org/download.php"
    color_print "Checking if git exists..."
    which git || die "No git installed!\nPlease install git from http://git-scm.com/downloads/"
    color_print "Check if ctags exists..."
    which ctags || warn "No ctags installed!\nPlease install ctags form http://ctags.sourceforge.net/ after ivim intallation!"
}

backup() {
    color_print "Backing up current vim config..."
    for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do [ -e $i ] && mv -f $i $i.backup; done
}

install() {
    color_print "Cloning ivim..."
    rm -rf $HOME/ivim
    git clone git://github.com/kepbod/ivim.git $HOME/ivim
    ln -s $HOME/ivim/vimrc $HOME/.vimrc
    color_print "Installing NeoBundle..."
    git clone git://github.com/Shougo/neobundle.vim.git $HOME/.vim/bundle/neobundle.vim
    color_print "Installing plugins using NeoBundle..."
    $HOME/.vim/bundle/neobundle.vim/bin/neoinstall > /dev/null 2>&1
    color_print "ivim has been installed. Just enjoy vimming!"
}

update() {
    color_print "updating ivim..."
    git pull origin master
    color_print "updating plugins..."
    $HOME/.vim/bundle/neobundle.vim/bin/neoinstall > /dev/null 2>&1
}

if [ $# -ne 1 ]; then
    help
fi

while getopts ":in" opts; do
    case $opts in
        i)
            logo
            require
            backup
            install
            ;;
        n)
            update
            ;;
        :)
            help;;
        ?)
            help;;
    esac
done
