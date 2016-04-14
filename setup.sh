#!/usr/bin/env bash

help() {
    echo "setup.sh -- setup ivim"
    echo "Usage: setup.sh -i/-n"
    echo "-i -- install ivim"
    echo "-m -- install mini ivim"
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
    git clone https://github.com/kepbod/ivim.git $HOME/ivim
    if [ $1 = 1 ]; then
        ln -s $HOME/ivim/vimrc $HOME/.vimrc
    else
        ln -s $HOME/ivim/vimrc_mini $HOME/.vimrc
    fi
    color_print "Installing vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    color_print "Installing hybrid theme..."
    git clone https://github.com/w0ng/vim-hybrid.git $HOME/.vim/bundle/vim-hybrid
    color_print "Installing plugins using vim-plug..."
    vim +PlugUpdate +qal
    color_print "ivim has been installed. Just enjoy vimming!"
}

update() {
    color_print "updating ivim..."
    git pull origin master
    color_print "updating plugins..."
    vim +PlugUpdate +qal
}

if [ $# -ne 1 ]; then
    help
fi

while getopts ":imn" opts; do
    case $opts in
        i)
            logo
            require
            backup
            install 1
            ;;
        m)
            logo
            require
            backup
            install 0
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
