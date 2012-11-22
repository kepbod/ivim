#!/usr/bin/env bash

echo "[ivim] Would you like to restore ivim plugins?"
echo "Type Y to restore: \c"
read line
if ["$line" = Y] || ["$line" = y]
then
    printf '\033[0;34m%s\033[0m\n' 'Restore ivim plugins...'
    rm -rf $HOME/.vim/bundle/
    git clone git://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
    git clone git://github.com/w0ng/vim-hybrid.git $HOME/.vim/bundle/vim-hybrid
    vim +'set nospell' +BundleInstall! +BundleClean! +qa! $HOME/ivim/tools/info.txt
    printf '\033[0;34m%s\033[0m\n' "ivim plugins were restored. Just enjoy vimming!"
fi
