""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Maintainer: Xiaoou Zhang (kepbod) <kepbod@gmail.com>
"
" Sections:
"   -> General
"   -> Platform Specific Configuration
"   -> Vim User Interface
"   -> Colors and Fonts
"   -> Status Line
"   -> Indent and Tab Related
"   -> Search Related
"   -> Fold Related
"   -> Key Mapping
"
"   -> Vundle
"   -> Tagbar
"   -> NERD_tree
"   -> NERD_commenter
"   -> snipMate
"   -> delimitMate
"   -> Supertab
"   -> Command-T
"   -> Ack
"   -> Syntastic
"   -> Indent Guides
"   -> Gundo
"   -> EasyTags
"   -> SingleCompile
"   -> TabMan
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
"   > snipMate - https://github.com/garbas/vim-snipmate
"     Implement some of TextMate's snippets features in Vim
"     info -> :help snipMate.txt
"   > surround - https://github.com/tpope/vim-surround
"     provide mappings to delete, change and add surroundings in pairs
"     info -> :help surround.txt
"   > delimitMate - https://github.com/Raimondi/delimitMate
"     provides automatic closing of quotes, parenthesis, brackets, etc.
"     info -> :help delimitMate.txt
"   > Supertab - https://github.com/ervandew/supertab
"     Perform all your insert completion using the tab key
"     info -> :help supertab.txt
"   > Command-T - https://github.com/wincent/Command-T
"     Provide fast, intuitive mechanism for opening files and buffers
"     info -> :help command-t.txt
"   > Ack - https://github.com/mileszs/ack.vim
"     A replacement for 'grep' using Perl module App::Ack
"     info -> :help ack.txt
"   > Tabular - https://github.com/godlygeek/tabular
"     Line up text easily
"     info -> :help Tabular.txt
"   > Syntastic - https://github.com/scrooloose/syntastic
"     syntax check that runs files through external syntax checkers
"     info -> :help syntastic.txt
"   > EasyMotion - https://github.com/Lokaltog/vim-easymotion
"     provide a much simpler way to use some motions in vim
"     info -> :help easymotion.txt
"   > Indent Guides - https://github.com/mutewinter/vim-indent-guides
"     visually display indent levels in Vim
"     info -> :help indent_guides.txt
"   > fugitive - https://github.com/tpope/vim-fugitive
"     Git wrapper
"     info -> :help fugitive.txt
"   > Gundo - https://github.com/sjl/gundo.vim
"     visualize VIM undo tree
"     info -> :help gundo.txt
"   > EasyTags - https://github.com/xolox/vim-easytags
"     Automated tag generation and syntax highlighting in Vim
"     info -> :help easytags.txt
"   > SmartusLine - https://github.com/molok/vim-smartusline
"     change color of statusline with the current mode
"     info -> :help smartusline.txt
"   > SingleCompile - https://github.com/xuhdev/SingleCompile
"     compile or run a single source file without leaving vim
"     info -> :help SingleCompile.txt
"   > TabMan - https://github.com/kien/tabman.vim
"     provide a convenient way to navigate between tabs and windows
"     info -> :help tabman.txt
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
nnoremap <Leader>v :tabedit $MYVIMRC<CR>

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
                \  'backup': 'backupdir',
                \ 'view': 'viewdir',
                \ 'swap': 'directory',
                \ 'undo': 'undodir'}
    for [dirname, settingname] in items(dir_list)
        let directory=parent.'/'.prefix.'/'.dirname.'/'
        if !isdirectory(directory)
            if exists('*mkdir')
                call mkdir(directory)
                exec 'set '.settingname.'='.directory
            else
                echo "Warning: Unable to create directory: ".directory
                echo "Try: mkdir -p ".directory
            endif
        else
            exec 'set '.settingname.'='.directory
        endif
    endfor
endfunction
call InitializeDirectories()

autocmd BufWinLeave *.* silent! mkview " Make vim save view (state) (folds, cursor, etc)
autocmd BufWinEnter *.* silent! loadview " Make vim load view (state) (folds, cursor, etc)

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
set tabpagemax=5 " Only show 5 tabs

if has("gui_running")
    set lines=50
    set columns=90
endif

set backspace=indent,eol,start " Make backspaces delete sensibly
set whichwrap+=h,l,<,>,[,] " Backspace and cursor keys wrap to
set virtualedit=block,onemore " Allow for cursor beyond last character
set scrolljump=5 " Lines to scroll when cursor leaves screen
set scrolloff=3 " Minimum lines to keep above and below cursor

set showmatch " Show matching brackets/parenthesis
set matchtime=2 " Decrease the time to blink
" Use Tab instead of % to switch among brackets/parenthesis
nnoremap <Tab> %
vnoremap <Tab> %

set number " Show line numbers
" Toggle relativenumber
function! ToggleRelativenumber()
    if &number==1
        set relativenumber
    else
        set number
    endif
endfunction
nnoremap <Leader>n :call ToggleRelativenumber()<CR>
set wrap " Set wrap
set showbreak=↪  " Change wrap line break
set textwidth=80 " Change text width
set colorcolumn=85 " Indicate text border
set formatoptions+=rnlmM " Optimize format options
set list " Show these tabs and spaces and so on
set listchars=tab:▸\ ,eol:¬
" Only show trailing whitespace when not in insert mode
augroup trailing
    autocmd!
    autocmd InsertEnter * :set listchars-=trail:⌴
    autocmd InsertLeave * :set listchars+=trail:⌴
augroup end

" Set gvim UI setting
if has('gui_running')
    set guioptions-=m
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Colors and Fonts
"-------------------------------------------------

syntax on " Enable syntax
if $TERM=='xterm'
    set t_Co=256
endif
if ( has('win32') || has('win64') ) && !has('gui_running')
    colorscheme desert " Set colorscheme
else
    colorscheme lucius " Set colorscheme
endif
if has('gui_running')
    set background=dark " Set background
elseif has('win32') || has('win64')
    set background=dark " Set background
else
    set background=light " Set background
endif

if has("gui_running")
    if has("gui_gtk2")
        set guifont=Monospace\ 18
    elseif has("x11")
        set guifont=Menlo\ Regular:h18
    elseif has("gui_win32")
        set guifont=Consolas:h18:cANSI
    endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Status Line
"-------------------------------------------------

set laststatus=2 "Show the statusline

" Set the style of the status line
set statusline=%<%f\  " Filename
set statusline+=%w%h%m%r " Options
set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y] " filetype
set statusline+=\ [%{getcwd()}] " current directory
set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII/Hexadecimal value of char
set statusline+=\ %{SyntasticStatuslineFlag()} " Syntax errors and warnings
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
set cindent " set C style indent
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

" Use sane regexes
nnoremap / /\v
vnoremap / /\v

" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv

" Visual search mappings
function! s:VSetSearch()
    let temp=@@
    normal! gvy
    let @/='\V'.substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@=temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

" Use ,Space to toggle the highlight search
nnoremap <Leader><Space> :set hlsearch!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------------------------------
" => Fold Related
"-------------------------------------------------

set foldlevelstart=0 " Start with all folds closed
set foldcolumn=1 " Set fold column

" Space to toggle and create folds.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Set foldtext
function! MyFoldText()
    let line=getline(v:foldstart)
    let nucolwidth=&foldcolumn+&number*&numberwidth
    let windowwidth=winwidth(0)-nucolwidth-3
    let foldedlinecount=v:foldend-v:foldstart+1
    let onetab=strpart('          ', 0, &tabstop)
    let line=substitute(line, '\t', onetab, 'g')
    let line=strpart(line, 0, windowwidth-2-len(foldedlinecount))
    let fillcharcount=windowwidth-len(line)-len(foldedlinecount)
    return line.'…'.repeat(" ",fillcharcount).foldedlinecount.'…'.' '
endfunction
set foldtext=MyFoldText()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Key Mapping
"-------------------------------------------------

" Disable array keys
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Redesign moving keys in insert mode
inoremap <C-K> <Up>
inoremap <C-J> <Down>
inoremap <C-H> <Left>
inoremap <C-L> <Right>

" Make j and k work the way you expect
nnoremap j gj
nnoremap k gk

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Navigation between windows
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-O> <C-W>o

" Navigation between tabs
nnoremap <Leader>1 :tabn 1<CR>
nnoremap <Leader>2 :tabn 2<CR>
nnoremap <Leader>3 :tabn 3<CR>
nnoremap <Leader>4 :tabn 4<CR>
nnoremap <Leader>5 :tabn 5<CR>

" Remap ; to :
nnoremap ; :
vnoremap ; :

" Quickly escaping
inoremap nn <ESC>
vnoremap nn <ESC>

" Strip all trailing whitespace in the current file
nnoremap <Leader>w :%s/\s\+$//<cr>:let @/=''<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Vundle
"--------------------------------------------------

filetype off " Required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" UI Additions
Bundle 'molok/vim-smartusline'
Bundle 'mutewinter/vim-indent-guides'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'sjl/gundo.vim'
" Navigation
Bundle 'kien/tabman.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'wincent/Command-T'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-fugitive'
" Commands
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle 'xuhdev/SingleCompile'
" Automatic Helper
Bundle 'garbas/vim-snipmate'
Bundle 'ervandew/supertab'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'

" Others
Bundle 'xolox/vim-easytags'
" Bundles needed by snipMate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'

filetype plugin indent on " Required!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Tagbar
"--------------------------------------------------

nnoremap <Leader>e :TagbarToggle<CR>
let g:tagbar_autofocus=1
let g:tagbar_expand=1
let g:tagbar_foldlevel=2
let g:tagbar_ironchars=['▾', '▸']
let g:tagbar_autoshowtag=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => NERD_tree
"--------------------------------------------------

nnoremap <Leader>d :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <Leader>f :NERDTreeFind<CR>
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

"--------------------------------------------------
" => snipMate
"--------------------------------------------------

let g:snip_author='Xiaoou Zhang (kepbod) <kepbod@gmail.com>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => delimitMate
"--------------------------------------------------

let delimitMate_expand_cr=1
let delimitMate_expand_space=1
let delimitMate_balance_matchpairs = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Supertab
"--------------------------------------------------

let g:SuperTabDefaultCompletionType='context'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Command-T
"--------------------------------------------------

nnoremap <Leader>g :CommandTBuffer<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Ack
"--------------------------------------------------

nnoremap <Leader>a :Ack!
if has('unix')
    let g:ackprg='ack-grep -H --nocolor --nogroup --column'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Syntastic
"--------------------------------------------------

nnoremap <Leader>s :Errors<CR>
let g:syntastic_check_on_open=1
let g:syntastic_auto_jump=1
let g:syntastic_stl_format='[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Indent Guides
"--------------------------------------------------

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=darkgray ctermbg=darkgray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgray ctermbg=darkgray
let g:indent_guides_color_change_percent=5
let g:indent_guides_guide_size=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Gundo
"--------------------------------------------------

nnoremap <Leader>u :GundoToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => EasyTags
"--------------------------------------------------

function! InitializeTagDirectory()
    let parent=$HOME
    let prefix='.vim'
    let dirname='tags'
    let directory=parent.'/'.prefix.'/'.dirname.'/'
    if !isdirectory(directory)
        if exists('*mkdir')
            call mkdir(directory)
            let g:easytags_by_filetype=directory
        else
            echo "Warning: Unable to create directory: ".directory
            echo "Try: mkdir -p ".directory
        endif
    else
        let g:easytags_by_filetype=directory
    endif
endfunction
call InitializeTagDirectory()
let g:easytags_python_enabled=1
let g:easytags_python_script=1
let g:easytags_include_members=1
highlight cMember gui=italic

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => SingleCompile
"--------------------------------------------------

nnoremap <Leader>b :SingleCompile<CR>
nnoremap <Leader>r :SingleCompileRun<CR>
let g:SingleCompile_showquickfixiferror=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => SingleCompile
"--------------------------------------------------

let g:tabman_specials=1
let g:tabman_number=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
