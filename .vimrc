""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Maintainer: Xiaoou Zhang (kepbod) <kepbod@gmail.com>
"
" Sections:
"   -> General
"   -> Platform Specific Configuration
"   -> Plugin
"   -> Vim User Interface
"   -> Colors and Fonts
"   -> Indent and Tab Related
"   -> Search Related
"   -> Fold Related
"   -> Filetype specific
"   -> Key Mapping
"
"   -> Tagbar
"   -> NERD_tree
"   -> NERD_commenter
"   -> Neocomplcache
"   -> snipMate
"   -> delimitMate
"   -> Ctrlp
"   -> Ack
"   -> Syntastic
"   -> Indent Guides
"   -> Gundo
"   -> EasyTags
"   -> SingleCompile
"   -> Zencoding
"   -> Golden Ratio
"   -> Splitjoin
"   -> Unite
"   -> vimux
"
" Plugins_Included:
"   > Vundle - https://github.com/gmarik/vundle
"     Manage the Vim scripts
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
"   > Neocomplcache - https://github.com/Shougo/neocomplcache
"     Performs keyword completion by maintaining a cache of keywords
"     info -> :help neocomplcache.txt
"   > snipMate - https://github.com/garbas/vim-snipmate
"     Implement some of TextMate's snippets features in Vim
"     info -> :help snipMate.txt
"   > surround - https://github.com/tpope/vim-surround
"     Provide mappings to delete, change and add surroundings in pairs
"     info -> :help surround.txt
"   > delimitMate - https://github.com/Raimondi/delimitMate
"     Provides automatic closing of quotes, parenthesis, brackets, etc.
"     info -> :help delimitMate.txt
"   > Ctrlp - https://github.com/kien/ctrlp.vim
"     Full path fuzzy file, buffer, mru and tag finder with an intuitive interface
"     info -> :help ctrlp.txt
"   > Ack - https://github.com/mileszs/ack.vim
"     A replacement for 'grep' using Perl module App::Ack
"     info -> :help ack.txt
"   > Tabular - https://github.com/godlygeek/tabular
"     Line up text easily
"     info -> :help Tabular.txt
"   > Syntastic - https://github.com/scrooloose/syntastic
"     Syntax check that runs files through external syntax checkers
"     info -> :help syntastic.txt
"   > EasyMotion - https://github.com/Lokaltog/vim-easymotion
"     Provide a much simpler way to use some motions in Vim
"     info -> :help easymotion.txt
"   > Indent Guides - https://github.com/mutewinter/vim-indent-guides
"     Visually display indent levels in Vim
"     info -> :help indent_guides.txt
"   > fugitive - https://github.com/tpope/vim-fugitive
"     Git wrapper
"     info -> :help fugitive.txt
"   > Gundo - https://github.com/sjl/gundo.vim
"     Visualize Vim undo tree
"     info -> :help gundo.txt
"   > EasyTags - https://github.com/xolox/vim-easytags
"     Automated tag generation and syntax highlighting in Vim
"     info -> :help easytags.txt
"   > Powerline - https://github.com/Lokaltog/vim-powerline
"     Create better-looking, more functional Vim statuslines
"     info -> :help Powerline.txt
"   > SingleCompile - https://github.com/xuhdev/SingleCompile
"     Compile or run a single source file without leaving Vim
"     info -> :help SingleCompile.txt
"   > CamelCaseMotion - https://github.com/bkad/CamelCaseMotion
"     Refine words motion in Vim
"     info -> :help camelcasemotion.txt
"   > Zencoding - https://github.com/mattn/zencoding-vim
"     High-speed HTML, XML, XSL coding and editing
"     info -> :help zencoding.txt
"   > Golden Ratio - https://github.com/roman/golden-ratio
"     Resize windows automatically using the Golden Ratio
"     info -> :help golden_ratio.txt
"   > Splitjoin - https://github.com/AndrewRadev/splitjoin.vim
"     Switch between a single-line statement and a multi-line one
"     info -> :help splitjoin.txt
"   > Unite - https://github.com/Shougo/unite.vim
"     Search and display information from arbitrary sources
"     info -> :help unite.txt
"   > rails.vim - https://github.com/tpope/vim-rails
"     Plugin for working with Ruby on Rails applications
"     info -> :help rails.txt
"   > Indent Object - https://github.com/michaeljsmith/vim-indent-object
"     Text objects based on indent levels
"     info -> :help indent-object.txt
"   > NrrwRgn - https://github.com/chrisbra/NrrwRgn
"     Focus on a region and making the rest inaccessible
"     info -> :help NrrwRgn.txt
"   > unimpaired.vim - https://github.com/tpope/vim-unimpaired
"     Complementary pairs of mappings
"     info -> :help unimpaired.txt
"   > abolish.vim - https://github.com/tpope/vim-abolish
"     Search for, substitute, and abbreviate multiple variants of a word
"     info -> :help abolish.txt
"   > vimux - https://github.com/benmills/vimux
"     Easily interact with tmux from vim
"     info -> :help vimux.txt
"   > vim-ipython - https://github.com/ivanov/vim-ipython
"     Integrate vim with ipython
"     info -> https://github.com/ivanov/vim-ipython/blob/master/README.rst
"   > markdown-preview - https://github.com/swaroopch/vim-markdown-preview
"     Select Markdown text, render to HTML and preview in browser
"     info -> https://github.com/swaroopch/vim-markdown-preview/blob/master/README.md
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"------------------------------------------------
" => General
"------------------------------------------------

set nocompatible " Get out of VI's compatible mode
filetype plugin indent on " Enable filetype
let mapleader=',' " Change the mapleader
let maplocalleader='\' " Change the maplocalleader
set timeoutlen=500 " Time to wait for a command

" Source the vimrc file after saving it
autocmd BufWritePost .vimrc source $MYVIMRC
" Fast edit the .vimrc file using ',v'
nnoremap <Leader>v :tabedit $MYVIMRC<CR>

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
                \ 'backup': 'backupdir',
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

autocmd BufWinLeave *.* silent! mkview " Make Vim save view (state) (folds, cursor, etc)
autocmd BufWinEnter *.* silent! loadview " Make Vim load view (state) (folds, cursor, etc)

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

set viewoptions+=slash,unix " Better Unix/Windows compatibility
set fileformats=unix,mac,dos " Auto detect the file formats

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Plugin
"--------------------------------------------------

filetype off " Required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" UI Additions
Bundle 'altercation/vim-colors-solarized'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'Lokaltog/vim-powerline'
Bundle 'mutewinter/vim-indent-guides'
Bundle 'roman/golden-ratio'
Bundle 'chrisbra/NrrwRgn'
" Navigation
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bkad/CamelCaseMotion'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'tpope/vim-unimpaired'
Bundle 'sjl/gundo.vim'
Bundle 'majutsushi/tagbar'
Bundle 'Shougo/unite.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'benmills/vimux'
" Commands
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-abolish'
Bundle 'godlygeek/tabular'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'xuhdev/SingleCompile'
" Automatic Helper
Bundle 'Shougo/neocomplcache'
Bundle 'garbas/vim-snipmate'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
" Language related
Bundle 'ivanov/vim-ipython'
Bundle 'tpope/vim-rails'
Bundle 'mattn/zencoding-vim'
Bundle 'swaroopch/vim-markdown-preview'

" Others
Bundle 'xolox/vim-easytags'
Bundle 'tpope/vim-repeat'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'

filetype plugin indent on " Required!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Vim User Interface
"-------------------------------------------------

" Set title
set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}

" Set tabline
set showtabline=2 " Always show tab line
" Set up tab labels
set guitablabel=%m%N:%t\[%{tabpagewinnr(v:lnum)}\]
set tabline=%!MyTabLine()
function! MyTabLine()
    let s=''
    let t=tabpagenr() " The index of current page
    let i=1
    while i<=tabpagenr('$') " From the first page
      let buflist=tabpagebuflist(i)
      let winnr=tabpagewinnr(i)
      let s.=(i==t?'%#TabLineSel#':'%#TabLine#')
      let s.='%'.i.'T'
      let s.=' '
      let bufnr=buflist[winnr - 1]
      let file=bufname(bufnr)
      let m=''
      if getbufvar(bufnr, "&modified")
          let m='[+]'
      endif
      if file=~'\/.'
          let file=substitute(file,'.*\/\ze.','','')
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
    let s.=(tabpagenr('$')>1?'%999XX':'X')
    return s
  endfunction
" Set up tab tooltips with every buffer name
set guitabtooltip=%F

" Set status line
set laststatus=2 " Show the statusline
" Set the style of the status line
" Use vim-powerline to modify the statuls line
if has('gui_running') && (!has('win64') || !has('win32'))
  let g:Powerline_symbols='unicode'
endif
" Only have cursorline in current window and in normal window
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline
auto InsertEnter * set nocursorline
auto InsertLeave * set cursorline
set wildmenu " Show list instead of just completing
set wildmode=list:longest,full " Use powerful wildmenu
set shortmess=at " Avoids 'hit enter'
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

set formatoptions+=rnlmM " Optimize format options
set wrap " Set wrap
set textwidth=80 " Change text width
set colorcolumn=+1 " Indicate text border
set list " Show these tabs and spaces and so on
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮ " Change listchars
set linebreak " Wrap long lines at a blank
set showbreak=↪  " Change wrap line break
set fillchars=diff:⣿,vert:│ " Change fillchars
" Only show trailing whitespace when not in insert mode
augroup trailing
    autocmd!
    autocmd InsertEnter * :set listchars-=trail:⌴
    autocmd InsertLeave * :set listchars+=trail:⌴
augroup END

" Set gVim UI setting
if has('gui_running')
    set guioptions-=m
    set guioptions-=T
    set guioptions+=f
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Colors and Fonts
"-------------------------------------------------

syntax on " Enable syntax
set background=dark " Set background

if has('gui_running')
    colorscheme Tomorrow-Night " Load a colorscheme
else
    set t_Co=256 " Use 256 colors
    colorscheme Tomorrow-Night-Eighties " Load a colorscheme
endif

function! ToggleColor()
    if has('gui_running')
        let color=g:colors_name=='solarized'?'Tomorrow-Night':'solarized'
        exe 'colorscheme '.color
        exe 'IndentGuidesEnable'
    endif
endfunction
nnoremap <silent>\c :call ToggleColor()<CR>

if has('gui_running')
    if has('gui_gtk')
        set guifont=Monospace\ 13
    elseif has('gui_macvim')
        set guifont=Monaco:h13
    elseif has('gui_win32')
        set guifont=Consolas:h13:cANSI
    endif
endif

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
cnoremap s/ s/\v

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
    let @/='\V'.substitute(escape(@@, '\'), '\n', '\\n', 'g')
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
nnoremap <silent><Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
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
" => Filetype Specific
"-------------------------------------------------

" QuickFix
augroup ft_quickfix
    autocmd!
    autocmd Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap textwidth=0
augroup END

" Markdown
augroup ft_markdown
    autocmd!
    " Use <localLeader>1/2/3/4/5/6 to add headings
    autocmd Filetype markdown nnoremap <buffer> <localLeader>1 I# <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>2 I## <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>3 I### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>4 I#### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>5 I##### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>6 I###### <ESC>
    " Use <LocalLeader>b to add blockquotes in normal and visual mode
    autocmd Filetype markdown nnoremap <buffer> <localLeader>b I> <ESC>
    autocmd Filetype markdown vnoremap <buffer> <localLeader>b :s/^/> /<CR>
    " Use <localLeader>ul and <localLeader>ol to add list symbols in visual mode
    autocmd Filetype markdown vnoremap <buffer> <localLeader>ul :s/^/* /<CR>
    autocmd Filetype markdown vnoremap <buffer> <LocalLeader>ol :s/^/\=(line(".")-line("'<")+1).'. '/<CR>
    " Use <localLeader>e1/2/3 to add emphasis symbols
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e1 I*<ESC>A*<ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e2 I**<ESC>A**<ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e3 I***<ESC>A***<ESC>
    " Use <Leader>P to preview markdown file in browser
    autocmd Filetype markdown nnoremap <buffer> <Leader>P :MarkdownPreview<CR>
augroup END

" C and C++
augroup ft_c
    autocmd!
    " TODO
augroup END

" Python
augroup ft_python
    autocmd!
    function! ChoosePythonCompiler()
        echo "Please choose python compiler:\n"
        echo "1. Python2+\n"
        echo "2. Python3+\n"
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
augroup END

" Perl
augroup ft_perl
    autocmd!
    " TODO
augroup END

" Ruby
augroup ft_ruby
    autocmd!
    " TODO
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Key Mapping
"-------------------------------------------------

" Disable array keys' function
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
vnoremap j gj
vnoremap k gk

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Navigation between windows
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-O> <C-W>o

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Remap ; to :
nnoremap ; :
vnoremap ; :

" Quickly escaping
inoremap nn <ESC>
vnoremap nn <ESC>

" Map \<Space> to commenting
function! IsWhiteLine()
    if (getline(".")=~"^$")
        let oldlinenumber=line(".")
        :call NERDComment('n', 'Sexy')
        if (line(".")==oldlinenumber)
            :call NERDComment('n', 'Append')
        else
            normal! k
            startinsert!
        endif
    else
        :call NERDComment('n', 'Append')
    endif
endfunction
nnoremap <silent>\<Space> :call IsWhiteLine()<CR>

" Strip all trailing whitespace in the current file
nnoremap <Leader>q :%s/\s\+$//<CR>:let @/=''<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Tagbar
"--------------------------------------------------

nnoremap <Leader>t :TagbarToggle<CR>
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
nnoremap <Leader>f :NERDTreeFind<CR>
let NERDTreeChDirMode=2
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
" => Neocomplcache
"--------------------------------------------------

let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_auto_select=1
let g:neocomplcache_enable_auto_delimiter=1
let g:neocomplcache_enable_camel_case_completion=1
let g:neocomplcache_enable_underbar_completion=1

" Map <C-E> to cancel completion
inoremap <expr><C-E> neocomplcache#cancel_popup()

" Tab/Shift-Tab to cycle completions
inoremap <expr><Tab>  pumvisible() ? "\<C-N>" : "\<Tab>"
inoremap <expr><S-Tab>  pumvisible() ? "\<C-P>" : "\<S-Tab>"

" CR/S-CR: close popup and save indent.
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
inoremap <expr><S-CR> pumvisible() ? neocomplcache#close_popup() "\<CR>" : "\<CR>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => snipMate
"--------------------------------------------------

let g:snips_trigger_key=',,s'
let g:snips_trigger_key_backwards=',,s'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => delimitMate
"--------------------------------------------------

let delimitMate_expand_cr=1
let delimitMate_expand_space=1
let delimitMate_balance_matchpairs=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => Ctrlp
"--------------------------------------------------

let g:ctrlp_working_path_mode=0
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_cache_dir=$HOME.'/.vim/.cache/ctrlp'
let g:ctrlp_extensions=['tag', 'buffertag', 'quickfix', 'dir', 'rtscript']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Ack
"--------------------------------------------------

nnoremap <Leader>a :Ack!<Space>
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

if !has('gui_running')
    let g:indent_guides_auto_colors=0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=237
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=239
endif

let g:indent_guides_enable_on_vim_startup=1
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

nnoremap <Leader>r :SingleCompileRun<CR>
let g:SingleCompile_showquickfixiferror=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Zencoding
"--------------------------------------------------

let g:user_zen_leader_key='<C-Z>'
let g:user_zen_settings={'indentation':'   '}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Golden Ratio
"--------------------------------------------------

" Disable Golden Ratio plugin when in diff mode
if &diff
  let g:loaded_golden_ratio=1
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Splitjoin
"--------------------------------------------------

nnoremap sj :SplitjoinSplit<CR>
nnoremap sk :SplitjoinJoin<CR>
let g:splitjoin_normalize_whitespace=1
let g:splitjoin_align=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Unite
"--------------------------------------------------

nnoremap <Leader>m :Unite<Space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => vimux
"--------------------------------------------------

" Run the current file with rspec
nnoremap <Leader>xb :call RunVimTmuxCommand("clear; rspec " . bufname("%"))<CR>

" Run command without sending sending a return
nnoremap <Leader>xq :call RunVimTmuxCommand("clear; rspec " . bufname("%"), 0)<CR>

" Prompt for a command to run
nnoremap <Leader>xp :PromptVimTmuxCommand<CR>

" Run last command executed by RunVimTmuxCommand
nnoremap <Leader>xl :RunLastVimTmuxCommand<CR>

" Inspect runner pane
nnoremap <Leader>xi :InspectVimTmuxRunner<CR>

" Close all other tmux panes in current window
nnoremap <Leader>xx :CloseVimTmuxPanes<CR>

" Interrupt any command running in the runner pane
nnoremap <Leader>xs :InterruptVimTmuxRunner<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
