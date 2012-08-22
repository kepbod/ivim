#!/usr/bin/env bash

printf '\033[0;34m%s\033[0m\n' 'Upgrading ivim...'

# update ivim
cd $HOME/ivim/
if git pull origin master
then
    vim +'set nospell' +BundleInstall! +BundleClean! +mapclear +qa! $HOME/ivim/tools/info.txt
    printf '\033[0;34m%s\033[0m\n' '    _       _         '
    printf '\033[0;34m%s\033[0m\n' '   (_)   __(_)___ ___ '
    printf '\033[0;34m%s\033[0m\n' '  / / | / / / __ `__ \'
    printf '\033[0;34m%s\033[0m\n' ' / /| |/ / / / / / / /'
    printf '\033[0;34m%s\033[0m\n' '/_/ |___/_/_/ /_/ /_/ '
    printf '\033[0;34m%s\033[0m\n' '                      '
    printf '\033[0;34m%s\033[0m\n' 'ivim has been updated and is at the current version.'
else
    printf '\033[0;31m%s\033[0m\n' 'There was an error updating. Try again later?'
fi
