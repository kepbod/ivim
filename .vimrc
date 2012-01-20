""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Maintainer: Xiaoou Zhang (kepbod)
"
" Sections:
"   -> General
"   -> Platform Specific Configuration
"   -> Vim User Interface
"   -> Colors and Fonts
"   -> Status Line
"   -> Indent and Tab Related
"   -> Search Related
"   -> Key Mapping
"
"   -> Perl Section
"   -> Python Section
"
"   -> Vundle
"   -> Tagbar
"   -> NERD_tree
"   -> NERD_commenter
"
" Plugins_Included:
"   > Vundle - https://github.com/gmarik/vundle
"     Manage the vim scripts
"     info -> :help vundle.txt
"   > Tagbar - https://github.com/majutsushi/tagbar
"     Browse the tags of source code files
"     info -> :help tagbar.txt
"   > NERD_tree - https://github.com/scrooloose/nerdtree
"     Explore filesystem and to open files and directories
"     info -> :help NERD_tree.txt
"   > NERD_commenter - https://github.com/scrooloose/nerdcommenter
"     Provide many different commenting operations and styles
"     info -> :help NERD_commenter.txt
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"------------------------------------------------
" => General
"------------------------------------------------

set nocompatible " Get out of VI's compatible mode
filetype plugin indent on " Enable filetype
let mapleader=',' " Change the mapleader
set timeoutlen=500 " Time to wait for a command

" Source the vimrc file after saving it
autocmd bufwritepost .vimrc source $MYVIMRC
" Fast edit the .vimrc file using ',v'
nnoremap <leader>v :tabedit $MYVIMRC<CR>

set viewoptions+=slash,unix " Better Unix/Windows compatibility
set fileformats=unix,mac,dos " Auto detect the file formats

set autoread " Set autoread when a file is changed outside
set autowrite " Write on make/shell commands
set hidden " Turn on hidden"

set history=1000 " Increase the lines of history
set clipboard+=unnamed " Yanks go on clipboard instead
set spell " Spell checking on
set modeline " Turn on modeline
set encoding=utf-8 " Set utf-8 encoding

set complete=.,w,b,u,U
set completeopt+=longest " Optimize auto complete

set mousehide " Hide mouse after chars typed
set mouse=a " Mouse in all modes

set backup " Set backup
set undofile " Set undo

" Set directories
function! InitializeDirectories()
    let parent=$HOME
    let prefix='.vim'
    let dir_list={
                \ 'backup': 'backupdir',
                \ 'view': 'viewdir',
                \ 'swap': 'directory',
                \ 'undo': 'undodir'}
    for [dirname,settingname] in items(dir_list)
        let directory=parent.'/'.prefix.'/'.dirname.'/'
        if exists('*mkdir')
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create directory: ".directory
            echo "Try: mkdir -p ".directory
        else
            exec 'set '.settingname.'='.directory
        endif
    endfor
endfunction
call InitializeDirectories()

au BufWinLeave *.* silent! mkview " Make vim save view (state) (folds, cursor, etc)
au BufWinEnter *.* silent! loadview " Make vim load view (state) (folds, cursor, etc)

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Platform Specific Configuration
"-------------------------------------------------

" On Windows, also use '.vim' instead of 'vimfiles'
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Vim User Interface
"-------------------------------------------------

set title " Turn on title
set showtabline=2 " Always show tab line
set tabpagemax=10 " Only show 10 tabs

set backspace=indent,eol,start " Make backspaces delete sensibly
set whichwrap+=<,>,[,] " Backspace and cursor keys wrap to
set virtualedit=onemore " Allow for cursor beyond last character
set scrolljump=5 " Lines to scroll when cursor leaves screen
set scrolloff=3 " Minimum lines to keep above and below cursor
set nowrap " Wrap long lines
set textwidth=80 " Change text width
set colorcolumn=85 " Indicate text border
set formatoptions+=mM " Optimize format options
set foldmethod=marker " Folding configuration

set matchpairs+=<:> " Allow % to bounce between angles too
set showmatch " Show matching brackets/parenthesis
set matchtime=2 " Decrease the time to blink
nnoremap <tab> %
vnoremap <tab> %

set number " Show line numbers
function! ToggleRelativenumber()
    if &number==1
        set relativenumber
    else
        set number
    endif
endfunction
nnoremap <leader>n :call ToggleRelativenumber()<CR>
set list " Show these tabs and spaces and so on
set listchars=eol:¬,tab:▸\ ,extends:‽,precedes:‽

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Colors and fonts
"-------------------------------------------------

syntax on " Enable syntax
if $TERM=='xterm'
    set t_Co=256
endif
colorscheme lucius
if has("gui_running")
    set background=dark " Set background
else
    set background=light " Set background
endif

if has("gui_running")
    if has("gui_gtk2")
        :set guifont=Monospace\ 12
    elseif has("x11")
        :set guifont=Menlo\ Regular:h12
    elseif has("gui_win32")
        :set guifont=Consolas:h10:cANSI
    endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Status line
"-------------------------------------------------

set laststatus=2 "Show the statusline

" Set the style of the status line
set statusline=%<%f\  " Filename
set statusline+=%w%h%m%r " Options
set statusline+=\ [%{&ff}/%Y] " filetype
set statusline+=\ [%{getcwd()}] " current directory
set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file navigation info

set cursorline " Highlight the current line
set wildmenu " Show list instead of just completing
set wildmode=list:longest,full " Use powerful wildmenu 
set shortmess=at " Avoids 'hit enter'
set showcmd " Show cmd

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Indent and Tab Related
"-------------------------------------------------

set autoindent " Preserve current indent on new lines
set expandtab " Convert all tabs typed to spaces
set softtabstop=4 " Indentation levels every four columns
set shiftwidth=4 " Indent/outdent by four columns
set shiftround " Indent/outdent to nearest tabstop

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Search Related
"-------------------------------------------------

set ignorecase " Case insensitive search
set smartcase " Case sensitive when uc present
set hlsearch " Highlight search terms
set incsearch " Find as you type search
set gdefault " turn on 'g' flag
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :set hlsearch!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Key Mapping
"-------------------------------------------------

" Disable array keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Redesign moving keys in insert mode
inoremap <C-k> <up>
inoremap <C-j> <down>
inoremap <C-h> <left>
inoremap <C-l> <right>

" Navigation between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Remap ; to :
nnoremap ; :

" Quickly escaping
inoremap jj <ESC>
vnoremap jj <ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Perl section
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => R section
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Vundle
"--------------------------------------------------

filetype off " Required!
set rtp+=~/.vim/bundle/vundle/ 
call vundle#rc()
" Let Vundle manage Vundle
Bundle 'gmarik/vundle'
" My Bundles here:
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'garbas/vim-snipmate'
Bundle 'tpope/vim-surround'
Bundle 'Raimondi/delimitMate'
Bundle 'ervandew/supertab'
Bundle 'wincent/Command-T'
Bundle 'mileszs/ack.vim'
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/syntastic'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
filetype plugin indent on " Required!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Tagbar
"--------------------------------------------------

nnoremap <leader>t :TagbarToggle<CR>
let g:tagbar_autofocus=1
let g:tagbar_expand=1
let g:tagbar_foldlevel=2
let g:tagbar_ironchars=['▾', '▸']
let g:tagbar_autoshowtag=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => NERD_tree
"--------------------------------------------------

nnoremap <leader>d :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>f :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeDirArrows=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => NERD_commenter
"--------------------------------------------------

let NERDCommentWholeLinesInVMode=2
let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
