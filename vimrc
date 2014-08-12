""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       _       _
"      (_)   __(_)___ ___
"     / / | / / / __ `__ \
"    / /| |/ / / / / / / /
"   /_/ |___/_/_/ /_/ /_/
"
"   Main Contributor: Xiao-Ou Zhang (kepbod) <kepbod@gmail.com>
"   Version: 2.0 beta
"   Created: 2012-01-20
"   Last Modified: 2014-08-12
"
"   Sections:
"     -> ivim Setting
"     -> General
"     -> Platform Specific Setting
"     -> NeoBundle
"     -> User Interface
"     -> Colors and Fonts
"     -> Indent Related
"     -> Search Related
"     -> Fold Related
"     -> File Type Specific Setting
"     -> Key Mapping
"     -> Plugin Setting
"     -> Local Setting
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"------------------------------------------------
" => ivim Setting
"------------------------------------------------

" ivim user setting
let g:ivim_user='Xiao-Ou Zhang' " User name
let g:ivim_email='kepbod@gmail.com' " User email
let g:ivim_github='https://github.com/kepbod' " User github
" ivim UI setting
let g:ivim_fancy_font=1 " Enable using fancy font
let g:ivim_show_number=1 " Enable showing number
" ivim plugin setting
let g:ivim_bundle_groups=['ui', 'enhance', 'move', 'navigate',
            \'complete', 'compile', 'git', 'language']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"------------------------------------------------
" => General
"------------------------------------------------

set nocompatible " Get out of vi compatible mode
filetype plugin indent on " Enable filetype
let mapleader=',' " Change the mapleader
let maplocalleader='\' " Change the maplocalleader
set timeoutlen=500 " Time to wait for a command

" Source the vimrc file after saving it
autocmd BufWritePost $MYVIMRC source $MYVIMRC
autocmd BufWritePost $MYVIMRC NeoBundleClean
" Fast edit the .vimrc file using ,x
nnoremap <Leader>x :tabedit $MYVIMRC<CR>

set autoread " Set autoread when a file is changed outside
set autowrite " Write on make/shell commands
set hidden " Turn on hidden"

set history=1000 " Increase the lines of history
set clipboard+=unnamed " Yanks go on clipboard instead
set modeline " Turn on modeline
set encoding=utf-8 " Set utf-8 encoding
set completeopt+=longest " Optimize auto complete
set completeopt-=preview " Optimize auto complete

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
                \ 'undo': 'undodir',
                \ 'cache': '',
                \ 'session': ''}
    for [dirname, settingname] in items(dir_list)
        let directory=parent.'/'.prefix.'/'.dirname.'/'
        if !isdirectory(directory)
            if exists('*mkdir')
                call mkdir(directory, 'p')
            else
                echo 'Warning: Unable to create directory: '.directory
            endif
        endif
        if settingname!=''
            exec 'set '.settingname.'='.directory
        endif
    endfor
endfunction
call InitializeDirectories()

autocmd BufWinLeave *.* silent! mkview " Make Vim save view (state) (folds, cursor, etc)
autocmd BufWinEnter *.* silent! loadview " Make Vim load view (state) (folds, cursor, etc)

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Platform Specific Setting
"-------------------------------------------------

" On Windows, also use .vim instead of vimfiles
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

set viewoptions+=slash,unix " Better Unix/Windows compatibility
set viewoptions-=options " in case of mapping change

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => NeoBundle
"--------------------------------------------------

if has('vim_starting')
    set nocompatible
    set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand($HOME . '/.vim/bundle/'))

" Use NeoBundle to manager plugins
NeoBundleFetch 'Shougo/neobundle.vim'

if count(g:ivim_bundle_groups, 'ui') " UI setting
    NeoBundle 'w0ng/vim-hybrid' " Colorscheme hybrid
    NeoBundle 'altercation/vim-colors-solarized' " Colorscheme solarized
    NeoBundle 'chriskempson/base16-vim' " Colorscheme base16
    NeoBundle 'bling/vim-airline' " Status line
    NeoBundle 'bling/vim-bufferline' " Buffer line
    NeoBundle 'nathanaelkane/vim-indent-guides' " Indent guides
    NeoBundle 'mhinz/vim-startify' " Start page
endif

if count(g:ivim_bundle_groups, 'enhance') " Vim enhancement
    NeoBundle 'Raimondi/delimitMate' " Closing of quotes
    NeoBundle 'scrooloose/nerdcommenter' " NERD commenter
    NeoBundle 'tpope/vim-abolish' " Abolish
    NeoBundle 'tpope/vim-speeddating' " Speed dating
    NeoBundle 'tpope/vim-repeat' " Repeat
    NeoBundle 'terryma/vim-multiple-cursors' " Multiple cursors
    NeoBundle 'mbbill/undotree' " Undo tree
    NeoBundle 'tpope/vim-surround' " Surround
    NeoBundle 'godlygeek/tabular' " Tabular
    NeoBundle 'AndrewRadev/splitjoin.vim' " Splitjoin
    NeoBundle 'sickill/vim-pasta' " Vim pasta
    NeoBundle 'Keithbsmiley/investigate.vim' " Helper
    NeoBundle 'wikitopian/hardmode' " Hard mode
    NeoBundle 'wellle/targets.vim' " Text objects
    NeoBundle 'roman/golden-ratio' " Resize windows
endif

if count(g:ivim_bundle_groups, 'move') " Moving
    NeoBundle 'tpope/vim-unimpaired' " Pairs of mappings
    NeoBundle 'Lokaltog/vim-easymotion' " Easy motion
    NeoBundle 'bkad/CamelCaseMotion' " Camel case motion
    NeoBundle 'majutsushi/tagbar' " Tag bar
    NeoBundle 'edsono/vim-matchit' " Match it
    NeoBundle 'Shougo/unite.vim' " Search engine
    NeoBundle 'Shougo/unite-outline' " Unite outline
    NeoBundle 'Shougo/vimproc', {
                \ 'build' : {
                \     'windows' : 'make -f make_mingw32.mak',
                \     'cygwin' : 'make -f make_cygwin.mak',
                \     'mac' : 'make -f make_mac.mak',
                \     'unix' : 'make -f make_unix.mak',
                \    },
                \ }
endif

if count(g:ivim_bundle_groups, 'navigate') " Navigation
    NeoBundle 'scrooloose/nerdtree' " NERD tree
    NeoBundle 'jistr/vim-nerdtree-tabs' " NERD tree tabs
    NeoBundle 'mhinz/vim-tmuxify' " Tmux panes
endif

if count(g:ivim_bundle_groups, 'complete') " Completion
    if has('lua')
        NeoBundle 'Shougo/neocomplete.vim' " Auto completion framework
        let g:ivim_completion_engine='neocomplete'
    else
        NeoBundle 'Shougo/neocomplcache.vim' " Auto completion framework
        let g:ivim_completion_engine='neocomplcache'
    endif
    NeoBundle 'Shougo/neosnippet.vim' " Snippet engine
    NeoBundle 'Shougo/neosnippet-snippets' " Snippets
    NeoBundle 'honza/vim-snippets' " Snippets
endif

if count(g:ivim_bundle_groups, 'compile') " Compiling
    NeoBundle 'scrooloose/syntastic' " Syntax checking
    NeoBundle 'xuhdev/SingleCompile' " Single compile
endif

if count(g:ivim_bundle_groups, 'git') " Git
    NeoBundle 'tpope/vim-fugitive' " Git wrapper
    NeoBundle 'gregsexton/gitv' " Gitk clone
    if has('signs')
        NeoBundle 'airblade/vim-gitgutter' " Git diff sign
    endif
endif

if count(g:ivim_bundle_groups, 'language') " Language Specificity
    NeoBundle 'matthias-guenther/hammer.vim' " Markup
    NeoBundle 'tpope/vim-rails' " Rails
    NeoBundle 'mattn/emmet-vim' " Emmet
    NeoBundle 'LaTeX-Box-Team/LaTeX-Box' " LaTex
    NeoBundle 'sheerun/vim-polyglot' " Language Support
endif

if filereadable(expand($HOME . '/.vimrc.bundles.local')) " Load local bundles
    source $HOME/.vimrc.bundles.local
endif

filetype plugin indent on " Required!

NeoBundleCheck

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => User Interface
"-------------------------------------------------

" Set title
set title
set titlestring=%t%(\ %m%)%(\ (%{expand('%:p:h')})%)%(\ %a%)

" Set tabline
set showtabline=2 " Always show tab line
" Set up tab labels
set guitablabel=%m%N:%t[%{tabpagewinnr(v:lnum)}]
set tabline=%!MyTabLine()
function! MyTabLine()
    let s=''
    let t=tabpagenr() " The index of current page
    let i=1
    while i<=tabpagenr('$') " From the first page
        let buflist=tabpagebuflist(i)
        let winnr=tabpagewinnr(i)
        let s.=(i==t ? '%#TabLineSel#' : '%#TabLine#')
        let s.='%'.i.'T'
        let s.=' '
        let bufnr=buflist[winnr-1]
        let file=bufname(bufnr)
        let buftype = getbufvar(bufnr, 'buftype')
        let m=''
        if getbufvar(bufnr, '&modified')
            let m='[+]'
        endif
        if buftype=='nofile'
            if file=~'\/.'
                let file=substitute(file, '.*\/\ze.', '', '')
            endif
        else
            let file=fnamemodify(file, ':p:t')
        endif
        if file==''
            let file='[No Name]'
        endif
        let s.=m
        let s.=i.':'
        let s.=file
        let s.='['.winnr.']'
        let s.=' '
        let i=i+1
    endwhile
    let s.='%T%#TabLineFill#%='
    let s.=(tabpagenr('$')>1 ? '%999XX' : 'X')
    return s
endfunction
" Set up tab tooltips with each buffer name
set guitabtooltip=%F

" Set status line
if count(g:ivim_bundle_groups, 'ui')
    set laststatus=2 " Show the statusline
    set noshowmode " Hide the default mode text
    let g:airline_theme='bubblegum'
    set ttimeoutlen=50
    let g:bufferline_echo=0
    let g:bufferline_modified='[+]'
    if g:ivim_fancy_font
        let g:airline_powerline_fonts=1
    else
        let g:airline_left_sep=''
        let g:airline_right_sep=''
    endif
endif

" Only have cursorline in current window and in normal window
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline
set wildmenu " Show list instead of just completing
set wildmode=list:longest,full " Use powerful wildmenu
set shortmess=at " Avoids hit enter
set showcmd " Show cmd

set backspace=indent,eol,start " Make backspaces delete sensibly
set whichwrap+=h,l,<,>,[,] " Backspace and cursor keys wrap to
set virtualedit=block,onemore " Allow for cursor beyond last character
set scrolljump=5 " Lines to scroll when cursor leaves screen
set scrolloff=3 " Minimum lines to keep above and below cursor
set sidescroll=1 " Minimal number of columns to scroll horizontally
set sidescrolloff=10 " Minimal number of screen columns to keep away from cursor

set showmatch " Show matching brackets/parenthesis
set matchtime=2 " Decrease the time to blink

if g:ivim_show_number
    set number " Show line numbers
    " Toggle relativenumber
    nnoremap <Leader>n :set relativenumber!<CR>
endif

set formatoptions+=rnlmM " Optimize format options
set wrap " Set wrap
set textwidth=80 " Change text width
if g:ivim_fancy_font
    set list " Show these tabs and spaces and so on
    set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮ " Change listchars
    set linebreak " Wrap long lines at a blank
    set showbreak=↪  " Change wrap line break
    set fillchars=diff:⣿,vert:│ " Change fillchars
    augroup trailing " Only show trailing whitespace when not in insert mode
        autocmd!
        autocmd InsertEnter * :set listchars-=trail:⌴
        autocmd InsertLeave * :set listchars+=trail:⌴
    augroup END
endif

" Set gVim UI setting
if has('gui_running')
    set guioptions-=m
    set guioptions-=T
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Colors and Fonts
"-------------------------------------------------

syntax on " Enable syntax
set background=dark " Set background
if !has('gui_running')
    set t_Co=256 " Use 256 colors
endif

" Load a colorscheme
if count(g:ivim_bundle_groups, 'ui')
    colorscheme hybrid
else
    colorscheme desert
endif

" Set GUI font
if has('gui_running')
    if has('gui_gtk')
        set guifont=DejaVu\ Sans\ Mono\ 11
    else
        set guifont=DejaVu\ Sans\ Mono:h11
    endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Indent Related
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
set gdefault " turn on g flag

" Use sane regexes
nnoremap / /\v
vnoremap / /\v
cnoremap s/ s/\v
nnoremap ? ?\v
vnoremap ? ?\v
cnoremap s? s?\v

" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap g* g*zzzv
nnoremap g# g#zzzv

" Visual search mappings
function! s:VSetSearch()
    let temp=@@
    normal! gvy
    let @/='\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@=temp
endfunction
vnoremap * :<C-U>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-U>call <SID>VSetSearch()<CR>??<CR>

" Use ,Space to toggle the highlight search
nnoremap <Leader><Space> :set hlsearch!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Fold Related
"-------------------------------------------------

set foldlevelstart=0 " Start with all folds closed
set foldcolumn=1 " Set fold column

" Space to toggle and create folds.
nnoremap <silent> <Space> @=(foldlevel('.') ? 'za' : '\<Space>')<CR>
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
    return line.'…'.repeat(' ',fillcharcount).foldedlinecount.'L'.' '
endfunction
set foldtext=MyFoldText()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => File Type Specific Setting
"-------------------------------------------------

" QuickFix
augroup ft_quickfix
    autocmd!
    autocmd filetype qf setlocal nolist nocursorline nowrap textwidth=0
augroup END

" Markdown
augroup ft_markdown
    autocmd!
    " Use <localLeader>1/2/3/4/5/6 to add headings
    autocmd filetype markdown nnoremap <buffer> <LocalLeader>1 I# <ESC>
    autocmd filetype markdown nnoremap <buffer> <LocalLeader>2 I## <ESC>
    autocmd filetype markdown nnoremap <buffer> <LocalLeader>3 I### <ESC>
    autocmd filetype markdown nnoremap <buffer> <LocalLeader>4 I#### <ESC>
    autocmd filetype markdown nnoremap <buffer> <LocalLeader>5 I##### <ESC>
    autocmd filetype markdown nnoremap <buffer> <LocalLeader>6 I###### <ESC>
    " Use <LocalLeader>b to add blockquotes in normal and visual mode
    autocmd filetype markdown nnoremap <buffer> <LocalLeader>b I> <ESC>
    autocmd filetype markdown vnoremap <buffer> <LocalLeader>b :s/^/> /<CR>
    " Use <localLeader>ul and <localLeader>ol to add list symbols in visual mode
    autocmd filetype markdown vnoremap <buffer> <LocalLeader>ul :s/^/* /<CR>
    autocmd filetype markdown vnoremap <buffer> <LocalLeader>ol :s/^/\=(line(".")-line("'<")+1).'. '/<CR>
    " Use <localLeader>e1/2/3 to add emphasis symbols
    autocmd filetype markdown nnoremap <buffer> <LocalLeader>e1 I*<ESC>A*<ESC>
    autocmd filetype markdown nnoremap <buffer> <LocalLeader>e2 I**<ESC>A**<ESC>
    autocmd filetype markdown nnoremap <buffer> <LocalLeader>e3 I***<ESC>A***<ESC>
    autocmd filetype markdown vnoremap <buffer> <LocalLeader>e1 :s/\%V\(.*\)\%V/\*\1\*/<CR>
    autocmd filetype markdown vnoremap <buffer> <LocalLeader>e2 :s/\%V\(.*\)\%V/\*\*\1\*\*/<CR>
    autocmd filetype markdown vnoremap <buffer> <LocalLeader>e3 :s/\%V\(.*\)\%V/\*\*\*\1\*\*\*/<CR>
    " Turn on spell
    autocmd filetype markdown setlocal spell
augroup END

" HTML
augroup ft_html
    autocmd!
    autocmd filetype html setlocal spell " Turn on spell
augroup END

" LESS
augroup ft_less
    autocmd!
    autocmd filetype less nnoremap <buffer> <Leader>r :w <BAR> !lessc % > %:t:r.css<CR><Space>
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Key Mapping
"-------------------------------------------------

" Make j and k work the way you expect
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Navigation between windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Repeat last substitution, including flags, with &.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Select entire buffer
nnoremap vaa ggvGg_

" Strip all trailing whitespace in the current file
nnoremap <Leader>q :%s/\s\+$//<CR>:let @/=''<CR>

" Modify all the indents
nnoremap \= gg=G

" See the differences between the current buffer and the file it was loaded from
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
            \ | diffthis | wincmd p | diffthis

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Plugin Setting
"--------------------------------------------------

" Setting for UI plugins
if count(g:ivim_bundle_groups, 'ui')

    " -> Indent Guides
    if !has('gui_running')
        let g:indent_guides_auto_colors=0
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=235
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
    endif
    let g:indent_guides_enable_on_vim_startup=1
    let g:indent_guides_guide_size=1
    let g:indent_guides_default_mapping=0
    let g:indent_guides_exclude_filetypes=['help', 'nerdtree', 'startify', 'markdown']

    " -> Startify
    let g:startify_session_dir=$HOME . '/.vim/session'
    let g:startify_custom_header=[
                \'       _       _         ',
                \'      (_)   __(_)___ ___ ',
                \'     / / | / / / __ `__ \',
                \'    / /| |/ / / / / / / /',
                \'   /_/ |___/_/_/ /_/ /_/ ',
                \'                         ']
    let g:startify_custom_footer=['', '    This configuration is maintained by Xiao-Ou Zhang <kepbod@gmail.com> and other contributors. Thanks!']
    if has('gui_running')
        hi StartifyHeader  guifg=#87afff
        hi StartifyFooter  guifg=#87afff
        hi StartifyBracket guifg=#585858
        hi StartifyNumber  guifg=#ffaf5f
        hi StartifyPath    guifg=#8a8a8a
        hi StartifySlash   guifg=#585858
    else
        hi StartifyHeader  ctermfg=111
        hi StartifyFooter  ctermfg=111
        hi StartifyBracket ctermfg=240
        hi StartifyNumber  ctermfg=215
        hi StartifyPath    ctermfg=245
        hi StartifySlash   ctermfg=240
    endif

endif

" Setting for enhancement plugins
if count(g:ivim_bundle_groups, 'enhance')

    " -> delimitMate
    let delimitMate_expand_cr=1
    let delimitMate_expand_space=1
    let delimitMate_balance_matchpairs=1

    " -> NERD Commenter
    let NERDCommentWholeLinesInVMode=2
    let NERDSpaceDelims=1
    let NERDRemoveExtraSpaces=1
    " Map \<Space> to commenting
    function! IsWhiteLine()
        if (getline('.')=~'^$')
            let oldlinenumber=line('.')
            call NERDComment('n', 'sexy')
            if (line('.')==oldlinenumber)
                call NERDComment('n', 'append')
            else
                normal! k
                startinsert!
            endif
        else
            normal! A
            call NERDComment('n', 'append')
        endif
    endfunction
    nnoremap <silent> <LocalLeader><Space> :call IsWhiteLine()<CR>

    " -> Undo tree
    nnoremap <Leader>u :UndotreeToggle<CR>
    let g:undotree_SetFocusWhenToggle=1

    " -> Splitjoin
    let g:splitjoin_split_mapping = ',s'
    let g:splitjoin_join_mapping  = ',j'
    let g:splitjoin_normalize_whitespace=1
    let g:splitjoin_align=1

    " -> investigate.vim
    nnoremap K :call investigate#Investigate()<CR>

endif

" setting for moving plugins
if count(g:ivim_bundle_groups, 'move')

    " -> Tag bar
    nnoremap <Leader>t :TagbarToggle<CR>
    let g:tagbar_autofocus=1
    let g:tagbar_expand=1
    let g:tagbar_foldlevel=2
    let g:tagbar_autoshowtag=1

    " Matchit
    " Use Tab instead of % to switch
    nmap <Tab> %
    vmap <Tab> %

    " -> Unite
    let g:unite_data_directory=$HOME . '/.vim/cache/unite'
    let g:unite_source_history_yank_enable=1
    let g:unite_source_rec_max_cache_files=100
    if g:ivim_fancy_font
        let g:unite_prompt='» '
    endif
    if executable('ag')
        " Use ag in unite grep source.
        let g:unite_source_grep_command='ag'
        let g:unite_source_grep_default_opts='--line-numbers --nocolor --nogroup --hidden'
        let g:unite_source_grep_recursive_opt=''
    elseif executable('ack-grep')
        " Use ack-grep in unite grep source.
        let g:unite_source_grep_command='ack-grep'
        let g:unite_source_grep_default_opts='--no-heading --no-color -a -H'
        let g:unite_source_grep_recursive_opt=''
    elseif executable('ack')
        " Use ack in unite grep source.
        let g:unite_source_grep_command='ack'
        let g:unite_source_grep_default_opts='--no-heading --no-color -a -H'
        let g:unite_source_grep_recursive_opt=''
    endif
    function! s:unite_settings() " Use ESC to exit, and use C-J and C-K to move
        nmap <buffer> <ESC> <plug>(unite_exit)
        imap <buffer> <ESC> <plug>(unite_exit)
        imap <buffer> <C-J> <Plug>(unite_select_next_line)
        imap <buffer> <C-K> <Plug>(unite_select_previous_line)
    endfunction
    autocmd filetype unite call s:unite_settings()
    nnoremap <silent> <Space>f :<C-U>Unite -start-insert -auto-resize -buffer-name=files file_rec/async<CR><C-U>
    nnoremap <silent> <Space>y :<C-U>Unite -start-insert -buffer-name=yanks history/yank<CR>
    nnoremap <silent> <Space>l :<C-U>Unite -start-insert -auto-resize -buffer-name=line line<CR>
    nnoremap <silent> <Space>o :<C-U>Unite -auto-resize -buffer-name=outline outline<CR>
    nnoremap <silent> <Space>b :<C-U>Unite -quick-match buffer<CR>
    nnoremap <silent> <Space>t :<C-U>Unite -quick-match tab<CR>
    nnoremap <silent> <Space>/ :<C-U>Unite -auto-resize -buffer-name=search grep:.<CR>

endif

" Setting for navigation plugins
if count(g:ivim_bundle_groups, 'navigate')

    " -> NERD Tree
    nnoremap <Leader>d :NERDTreeTabsToggle<CR>
    nnoremap <Leader>f :NERDTreeFind<CR>
    let NERDTreeChDirMode=2
    let NERDTreeShowBookmarks=1
    let NERDTreeShowHidden=1
    let NERDTreeShowLineNumbers=1
    let NERDTreeDirArrows=1
    let g:nerdtree_tabs_open_on_gui_startup=0

endif

" Setting for completion plugins
if count(g:ivim_bundle_groups, 'complete')

    " -> Neocomplete & Neocomplcache
    " Use Tab and S-Tab to select candidate
    inoremap <expr><Tab>  pumvisible() ? "\<C-N>" : "\<Tab>"
    inoremap <expr><S-Tab> pumvisible() ? "\<C-P>" : "\<S-Tab>"
    if g:ivim_completion_engine=='neocomplete'
        let g:neocomplete#enable_at_startup=1
        let g:neocomplete#data_directory=$HOME . '/.vim/cache/neocomplete'
        let g:neocomplete#enable_auto_delimiter=1
        " Use <C-E> to close popup
        inoremap <expr><C-E> neocomplete#cancel_popup()
        inoremap <expr><CR> delimitMate#WithinEmptyPair() ?
                    \ "\<C-R>=delimitMate#ExpandReturn()\<CR>" :
                    \ pumvisible() ? neocomplete#close_popup() : "\<CR>"
    else
        let g:neocomplcache_enable_at_startup=1
        let g:neocomplcache_temporary_dir=$HOME . '/.vim/cache/neocomplcache'
        let g:neocomplcache_enable_auto_delimiter=1
        let g:neocomplcache_enable_fuzzy_completion=1
        " Use <C-E> to close popup
        inoremap <expr><C-E> neocomplcache#cancel_popup()
        inoremap <expr><CR> delimitMate#WithinEmptyPair() ?
                    \ "\<C-R>=delimitMate#ExpandReturn()\<CR>" :
                    \ pumvisible() ? neocomplcache#close_popup() : "\<CR>"
    endif

    " -> Neosnippet
    " Set information for snippets
    let g:snips_author=g:ivim_user
    let g:snips_email=g:ivim_email
    let g:snips_github=g:ivim_github
    let g:neosnippet#enable_snipmate_compatibility=1
    " Use <C-K> to expand or jump snippets in insert mode
    imap <C-K> <Plug>(neosnippet_expand_or_jump)
    " Use <C-K> to replace TARGET within snippets in visual mode
    xmap <C-K> <Plug>(neosnippet_start_unite_snippet_target)
    " For snippet_complete marker
    if has('conceal')
        set conceallevel=2 concealcursor=i
    endif

endif

" Setting for compiling plugins
if count(g:ivim_bundle_groups, 'compile')

    " -> Syntastic
    let g:syntastic_check_on_open=1
    let g:syntastic_aggregate_errors=1
    let g:syntastic_auto_jump=1
    let g:syntastic_auto_loc_list=1
    if g:ivim_fancy_font
        let g:syntastic_error_symbol = '✗'
        let g:syntastic_style_error_symbol = '✠'
        let g:syntastic_warning_symbol = '∆'
        let g:syntastic_style_warning_symbol = '≈'
    endif

    " -> Singlecompile
    nnoremap <Leader>r :SingleCompileRun<CR>
    let g:SingleCompile_showquickfixiferror=1
    function! ChoosePythonCompiler()
        echo 'Please choose python compiler:\n'
        echo '1. Python2+\n'
        echo '2. Python3+\n'
        let flag=getchar()
        if flag==49
            call SingleCompile#ChooseCompiler('python', 'python')
            execute 'SingleCompileRun'
        elseif flag==50
            call SingleCompile#ChooseCompiler('python', 'python3')
            execute 'SingleCompileRun'
        endif
    endfunction
    autocmd filetype python nnoremap <buffer> <Leader>r :call ChoosePythonCompiler()<CR>

endif

" Setting for git plugins
if count(g:ivim_bundle_groups, 'git')
endif

" Setting for language specificity
if count(g:ivim_bundle_groups, 'language')

    " -> Emmet
    let g:user_emmet_leader_key='<C-Z>'
    let g:user_emmet_settings={'indentation':'    '}
    let g:use_emmet_complete_tag=1

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Local Setting
"--------------------------------------------------

" Use local vimrc if available
if filereadable(expand($HOME . '/.vimrc.local'))
    source $HOME/.vimrc.local
endif

" Use local gvimrc if available and gui is running
if has('gui_running')
    if filereadable(expand($HOME . '/.gvimrc.local'))
        source $HOME/.gvimrc.local
    endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
