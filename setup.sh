#!/usr/bin/env bash

help() {
    echo "setup.sh -- setup ivim"
    echo "Usage: setup.sh -i|-m|-u|-n"
    echo "-i -- install ivim"
    echo "-m -- install ivim_mini for vim"
    echo "-u -- install ivim_mini for neovim"
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
    if [ $1 = 0 ]; then
        color_print "Checking Vim version..."
        vim --version | grep -E 7.[3-9]\|8.[0-9] || die "Your vim's version is too low!\nPlease download higher version(7.3+) from http://www.vim.org/download.php"
    elif [ $1 = 1 ]; then
        color_print "Checking Vim version..."
        vim --version | grep -E 8.[0-9] || die "Your vim's version is too low!\nPlease download higher version(8.0+) from http://www.vim.org/download.php"
    else
        color_print "Checking NeoVim version..."
        nvim --version || die "Please install NeoVim according to https://github.com/neovim/neovim/wiki/Installing-Neovim"
    fi
    color_print "Checking if git exists..."
    which git || die "No git installed!\nPlease install git from http://git-scm.com/downloads/"
    color_print "Check if ctags exists..."
    which ctags || warn "No ctags installed!\nPlease install ctags form http://ctags.sourceforge.net/ after ivim intallation!"
}

install() {
    color_print "Cloning ivim..."
    rm -rf $HOME/.ivim
    git clone https://github.com/kepbod/ivim.git $HOME/.ivim
    if [ $1 = 0 ]; then
        ln -s $HOME/.ivim/vimrc $HOME/.vimrc
    elif [ $1 = 1 ]; then
        ln -s $HOME/.ivim/vimrc_mini $HOME/.vimrc
    else
        mkdir -p $HOME/.config/nvim
        ln -s $HOME/.ivim/vimrc_mini $HOME/.config/nvim/init.vim
    fi
    color_print "Installing vim-plug..."
    if [ $1 = 2 ]; then
        curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
    color_print "Installing colortheme..."
    if [ $1 = 0 ]; then
        git clone https://github.com/kristijanhusak/vim-hybrid-material.git $HOME/.vim/bundle/vim-hybrid-material
    elif [ $1 = 1 ]; then
        git clone https://github.com/jacoborus/tender.vim.git $HOME/.vim/plugged/tender.vim
    else
        git clone https://github.com/jacoborus/tender.vim.git $HOME/.config/nvim/plugged/tender.vim
    fi
    color_print "Installing plugins using vim-plug..."
    if [ $1 = 2 ]; then
        nvim +PlugUpdate +qal
    else
        vim +PlugUpdate +qal
    fi
    color_print "ivim has been installed. Just enjoy vimming!"
}

update() {
    color_print "updating ivim..."
    git pull origin master
    color_print "updating plugins..."
    if [ -e $HOME/.config/nvim/init.vim ]; then
        nvim +PlugUpdate +qal
    fi
    if [ -e $HOME/.vimrc ]; then
        vim +PlugUpdate +qal
    fi
}

if [ $# -ne 1 ]; then
    help
fi

while getopts ":imun" opts; do
    case $opts in
        i)
            logo
            require 0
            install 0
            ;;
        m)
            logo
            require 1
            install 1
            ;;
        u)
            logo
            require 2
            install 2
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
