#!/usr/bin/env bash

set -euo pipefail

readonly IVIM_REPO_URL="https://github.com/kepbod/ivim.git"
readonly VIM_PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

DRY_RUN=0
AUTO_YES=0

timestamp() {
    date +"%Y%m%d-%H%M%S"
}

help() {
    echo "setup.sh -- setup ivim"
    echo "Usage: setup.sh [--dry-run] [--yes] -i|-m|-u|-N|-n"
    echo "-i -- install ivim"
    echo "-m -- install ivim_mini for vim"
    echo "-u -- install ivim_mini for neovim"
    echo "-N -- install modern single-file neovim config"
    echo "-n -- update ivim"
    echo "-d, --dry-run -- print actions without executing"
    echo "-y, --yes -- non-interactive mode (auto-confirm prompts)"
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

backup_if_exists() {
    local target="$1"
    if [ -e "$target" ] || [ -L "$target" ]; then
        local backup="${target}.bak.$(timestamp)"
        mv "$target" "$backup"
        color_print "Backed up $target -> $backup"
    fi
}

require_cmd() {
    local cmd="$1"
    command -v "$cmd" >/dev/null 2>&1 || die "$cmd is required but not installed"
}

run_cmd() {
    if [ "$DRY_RUN" -eq 1 ]; then
        printf '[dry-run]'
        printf ' %q' "$@"
        printf '\n'
        return 0
    fi
    "$@"
}

confirm_or_exit() {
    local prompt="$1"
    if [ "$AUTO_YES" -eq 1 ]; then
        color_print "Auto-confirm: $prompt"
        return 0
    fi

    printf "%s [y/N]: " "$prompt"
    read -r answer
    case "$answer" in
        y|Y|yes|YES)
            return 0
            ;;
        *)
            die "Aborted by user."
            ;;
    esac
}

download_file() {
    local url="$1"
    local output="$2"

    if command -v curl >/dev/null 2>&1; then
        run_cmd curl -fLo "$output" --create-dirs "$url"
    elif command -v wget >/dev/null 2>&1; then
        run_cmd mkdir -p "$(dirname "$output")"
        run_cmd wget -qO "$output" "$url"
    else
        die "Neither curl nor wget is installed"
    fi
}

has_existing_targets() {
    local mode="$1"

    if [ -e "$HOME/.ivim" ] || [ -L "$HOME/.ivim" ]; then
        return 0
    fi

    case "$mode" in
        0|1)
            [ -e "$HOME/.vimrc" ] || [ -L "$HOME/.vimrc"
            ]
            ;;
        2)
            [ -e "$HOME/.config/nvim/init.vim" ] || [ -L "$HOME/.config/nvim/init.vim" ]
            ;;
        3)
            [ -e "$HOME/.config/nvim/init.vim" ] || [ -L "$HOME/.config/nvim/init.vim" ] || [ -e "$HOME/.config/nvim/init.lua" ] || [ -L "$HOME/.config/nvim/init.lua" ]
            ;;
        *)
            return 1
            ;;
    esac
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
    if [ "$1" = 0 ]; then
        color_print "Checking Vim version..."
        vim --version | grep -E 7.[3-9]\|8.[0-9] || die "Your vim's version is too low!\nPlease download higher version(7.3+) from http://www.vim.org/download.php"
    elif [ "$1" = 1 ]; then
        color_print "Checking Vim version..."
        vim --version | grep -E 8.[0-9] || die "Your vim's version is too low!\nPlease download higher version(8.0+) from http://www.vim.org/download.php"
    elif [ "$1" = 3 ]; then
        color_print "Checking NeoVim version..."
        nvim --version | head -n 1 | grep -E 'NVIM v(0\.(1[0-9]|[2-9][0-9])|[1-9]\.)' || die "Your NeoVim version is too low!\nPlease install NeoVim 0.10+ from https://neovim.io/"
    else
        color_print "Checking NeoVim version..."
        nvim --version || die "Please install NeoVim according to https://github.com/neovim/neovim/wiki/Installing-Neovim"
    fi
    color_print "Checking if git exists..."
    require_cmd git
    color_print "Check if ctags exists..."
    command -v ctags >/dev/null 2>&1 || warn "No ctags installed!\nPlease install ctags form http://ctags.sourceforge.net/ after ivim intallation!"
}

install() {
    local mode="$1"

    if has_existing_targets "$mode"; then
        confirm_or_exit "Existing ivim/Vim/Neovim config detected. Backup and continue?"
    fi

    color_print "Cloning ivim..."
    run_cmd cd "$HOME"
    backup_if_exists "$HOME/.ivim"
    run_cmd git clone --depth 1 "$IVIM_REPO_URL" "$HOME/.ivim"

    if [ "$mode" = 0 ]; then
        backup_if_exists "$HOME/.vimrc"
        run_cmd ln -s "$HOME/.ivim/vimrc" "$HOME/.vimrc"
    elif [ "$mode" = 1 ]; then
        backup_if_exists "$HOME/.vimrc"
        run_cmd ln -s "$HOME/.ivim/vimrc_mini" "$HOME/.vimrc"
    elif [ "$mode" = 3 ]; then
        run_cmd mkdir -p "$HOME/.config/nvim"
        backup_if_exists "$HOME/.config/nvim/init.vim"
        backup_if_exists "$HOME/.config/nvim/init.lua"
        run_cmd ln -s "$HOME/.ivim/nvim/init.lua" "$HOME/.config/nvim/init.lua"
    else
        run_cmd mkdir -p "$HOME/.config/nvim"
        backup_if_exists "$HOME/.config/nvim/init.vim"
        run_cmd ln -s "$HOME/.ivim/vimrc_mini" "$HOME/.config/nvim/init.vim"
    fi

    if [ "$mode" = 3 ]; then
        color_print "Installing plugins using lazy.nvim..."
        run_cmd env XDG_CONFIG_HOME="$HOME/.config" nvim --headless "+Lazy! sync" +qa
        color_print "ivim modern neovim config has been installed. Just enjoy vimming!"
        return
    fi

    color_print "Installing vim-plug..."
    if [ "$mode" = 2 ]; then
        download_file "$VIM_PLUG_URL" "$HOME/.config/nvim/autoload/plug.vim"
    else
        download_file "$VIM_PLUG_URL" "$HOME/.vim/autoload/plug.vim"
    fi

    color_print "Installing colortheme..."
    if [ "$mode" = 0 ]; then
        run_cmd rm -rf "$HOME/.vim/bundle/vim-hybrid-material"
        run_cmd git clone --depth 1 https://github.com/kristijanhusak/vim-hybrid-material.git "$HOME/.vim/bundle/vim-hybrid-material"
    elif [ "$mode" = 1 ]; then
        run_cmd rm -rf "$HOME/.vim/plugged/nord-vim"
        run_cmd git clone --depth 1 https://github.com/arcticicestudio/nord-vim.git "$HOME/.vim/plugged/nord-vim"
    else
        run_cmd rm -rf "$HOME/.config/nvim/plugged/nord-vim"
        run_cmd git clone --depth 1 https://github.com/arcticicestudio/nord-vim.git "$HOME/.config/nvim/plugged/nord-vim"
    fi

    color_print "Installing plugins using vim-plug..."
    if [ "$mode" = 2 ]; then
        run_cmd nvim +PlugUpdate +qal
    else
        run_cmd vim +PlugUpdate +qal
    fi
    color_print "ivim has been installed. Just enjoy vimming!"
}

update() {
    if [ ! -d "$HOME/.ivim" ]; then
        if [ "$DRY_RUN" -eq 1 ]; then
            warn "$HOME/.ivim not found. Dry-run will still show the planned update commands."
        else
            die "$HOME/.ivim not found. Please run setup.sh install first."
        fi
    fi

    if [ "$AUTO_YES" -eq 0 ]; then
        confirm_or_exit "Update ivim and all installed plugins now?"
    fi

    color_print "updating ivim..."
    run_cmd cd "$HOME/.ivim"
    run_cmd git pull origin master

    color_print "updating plugins..."
    if [ -e "$HOME/.config/nvim/init.lua" ]; then
        run_cmd env XDG_CONFIG_HOME="$HOME/.config" nvim --headless "+Lazy! sync" +qa
    fi
    if [ -e "$HOME/.config/nvim/init.vim" ]; then
        run_cmd nvim +PlugClean! +PlugUpdate +qal
    fi
    if [ -e "$HOME/.vimrc" ]; then
        run_cmd vim +PlugClean! +PlugUpdate +qal
    fi
}

if [ $# -eq 0 ]; then
    help
fi

action=""

while getopts ":imuNnyd-:" opts; do
    case $opts in
        i)
            action="i"
            ;;
        m)
            action="m"
            ;;
        u)
            action="u"
            ;;
        N)
            action="N"
            ;;
        n)
            action="n"
            ;;
        y)
            AUTO_YES=1
            ;;
        d)
            DRY_RUN=1
            ;;
        -)
            case "${OPTARG}" in
                yes)
                    AUTO_YES=1
                    ;;
                dry-run)
                    DRY_RUN=1
                    ;;
                help)
                    help
                    ;;
                *)
                    die "Unknown option --${OPTARG}"
                    ;;
            esac
            ;;
        :)
            die "Option -${OPTARG} requires an argument"
            ;;
        ?)
            help
            ;;
    esac
done

shift $((OPTIND - 1))
[ $# -eq 0 ] || die "Unexpected arguments: $*"

if [ -z "$action" ]; then
    help
fi

case "$action" in
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
    N)
        logo
        require 3
        install 3
        ;;
    n)
        update
        ;;
    *)
        help
        ;;
esac
