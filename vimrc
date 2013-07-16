""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Maintainer: Xiao-Ou Zhang (kepbod) <kepbod@gmail.com>
" Created: 2012-01-20
" Last Modified: 2013-07-16
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
"   -> Filetype Specific
"   -> Key Mapping
"   -> Local Setting
"
"   -> Tagbar
"   -> NERD_tree
"   -> NERD_commenter
"   -> Neocomplcache
"   -> delimitMate
"   -> Ag(Ack)
"   -> Syntastic
"   -> Indent Guides
"   -> fugitive
"   -> Gundo
"   -> EasyTags
"   -> SingleCompile
"   -> Zencoding
"   -> GoldenView
"   -> Splitjoin
"   -> Unite
"   -> vimux
"   ->Conque-Shell
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
"   > surround - https://github.com/tpope/vim-surround
"     Provide mappings to delete, change and add surroundings in pairs
"     info -> :help surround.txt
"   > delimitMate - https://github.com/Raimondi/delimitMate
"     Provides automatic closing of quotes, parenthesis, brackets, etc.
"     info -> :help delimitMate.txt
"   > Ag - https://github.com/rking/ag.vim
"     A front for ag, A.K.A. the_silver_searcher
"     info -> :help ag.txt
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
"   > Indent Guides - https://github.com/nathanaelkane/vim-indent-guides
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
"   > Powerline - https://github.com/Lokaltog/powerline
"     Create better-looking, more functional Vim statuslines
"     info -> https://powerline.readthedocs.org
"   > SingleCompile - https://github.com/xuhdev/SingleCompile
"     Compile or run a single source file without leaving Vim
"     info -> :help SingleCompile.txt
"   > CamelCaseMotion - https://github.com/bkad/CamelCaseMotion
"     Refine words motion in Vim
"     info -> :help camelcasemotion.txt
"   > Zencoding - https://github.com/mattn/zencoding-vim
"     High-speed HTML, XML, XSL coding and editing
"     info -> :help zencoding.txt
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
"   > markdown-preview - https://github.com/swaroopch/vim-markdown-preview
"     Select Markdown text, render to HTML and preview in browser
"     info -> https://github.com/swaroopch/vim-markdown-preview/blob/master/README.md
"   > unite-outline - https://github.com/h1mesuke/unite-outline
"     Provide your Vim's buffer with the outline view
"     info -> :help unite-outline.txt
"   > Swap-parameters - https://github.com/mutewinter/swap-parameters
"     Swap the parameters
"     info -> :help swap-parameters.txt
"   > autolink.vim - https://github.com/sampsyo/autolink.vim
"     Find and insert URLs for links in Markdown and ReST documents
"     info -> :help autolink.txt
"   > textobj-word-column.vim - https://github.com/coderifous/textobj-word-column.vim
"     Make operating on columns of code conceptually simpler and reduces keystrokes
"     info -> :help textobj-word-column.txt
"   > GoldenView.vim - https://github.com/zhaocai/GoldenView.Vim
"     Manage windows more convenient
"     info -> :help GoldenView.txt
"   > vim-startify - https://github.com/mhinz/vim-startify
"     Provide a good start screen for vim
"     info -> :help startify.txt
"   > vim-speeddating - https://github.com/tpope/vim-speeddating
"     Use CTRL-A/CTRL-X to increment dates, times, and more
"     info -> :help speeddating.txt
"   > vim-multiple-cursors - https://github.com/terryma/vim-multiple-cursors
"     Provide Sublime Text's awesome multiple selection feature to vim
"     info -> :help multiple_cursors.txt
"   > vim-matchit - https://github.com/tsaleh/vim-matchit
"     Extended matching with "%"
"     info -> :help matchit.txt
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
" Fast edit the .vimrc file using ',x'
nnoremap <Leader>x :tabedit $MYVIMRC<CR>

set autoread " Set autoread when a file is changed outside
set autowrite " Write on make/shell commands
set hidden " Turn on hidden"

set history=1000 " Increase the lines of history
set clipboard+=unnamed " Yanks go on clipboard instead
set spell " Spell checking on
set modeline " Turn on modeline
set encoding=utf-8 " Set utf-8 encoding
set completeopt+=longest " Optimize auto complete
set completeopt-=preview " Optimize auto complete

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
set viewoptions-=options " in case of mapping change
set fileformats=unix,mac,dos " Auto detect the file formats

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Plugin
"--------------------------------------------------

filetype off " Required!
let g:vundle_default_git_proto='git'
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" UI Additions
Bundle 'w0ng/vim-hybrid'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'
if has("python") || has("python3")
    Bundle 'Lokaltog/powerline', {'rtp':'/powerline/bindings/vim'}
    let old_powerline=0
else
    Bundle 'Lokaltog/vim-powerline'
    let old_powerline=1
endif
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'chrisbra/NrrwRgn'
Bundle 'mhinz/vim-startify'
" Navigation
Bundle 'Lokaltog/vim-easymotion'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'bkad/CamelCaseMotion'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'coderifous/textobj-word-column.vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'zhaocai/GoldenView.Vim'
if has('python')
    Bundle 'sjl/gundo.vim'
endif
if executable('ctags')
    Bundle 'majutsushi/tagbar'
endif
Bundle 'Shougo/unite.vim'
Bundle 'scrooloose/nerdtree'
if executable('ag')
    Bundle 'rking/ag.vim'
elseif executable('ack-grep') || executable('ack')
    Bundle 'mileszs/ack.vim'
endif
if executable('git')
    Bundle 'tpope/vim-fugitive'
endif
if has('ruby')
    Bundle 'benmills/vimux'
endif
Bundle 'tsaleh/vim-matchit'
" Commands
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-abolish'
Bundle 'godlygeek/tabular'
Bundle 'AndrewRadev/splitjoin.vim'
if has('python')
    Bundle 'mutewinter/swap-parameters'
endif
Bundle 'xuhdev/SingleCompile'
" Automatic Helper
Bundle 'Shougo/neocomplcache'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-speeddating'
" Language related
Bundle 'tpope/vim-rails'
Bundle 'mattn/zencoding-vim'
Bundle 'swaroopch/vim-markdown-preview'
Bundle 'sampsyo/autolink.vim'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'juvenn/mustache.vim'
Bundle 'elzr/vim-json'
Bundle 'groenewege/vim-less'
Bundle 'pangloss/vim-javascript'
Bundle 'kepbod/php_indent'

" Others
if executable('ctags')
    Bundle 'xolox/vim-easytags'
endif
Bundle 'h1mesuke/unite-outline'
Bundle 'tpope/vim-repeat'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'Shougo/neosnippet'
Bundle 'honza/vim-snippets'
Bundle 'xolox/vim-misc'
Bundle 'wikitopian/hardmode'

" Local bundles if avaiable
if filereadable(expand("~/.vimrc.bundles.local"))
    source ~/.vimrc.bundles.local
endif

Bundle 'acx0/Conque-Shell'

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
set noshowmode " Hide the default mode text
" Set the style of the status line
" Use powerline to modify the statuls line
if has('gui_running') && (!has('win64') || !has('win32')) && old_powerline == 1
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
" Use Tab instead of % to switch using matchit
nmap <Tab> %
vmap <Tab> %

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
colorscheme hybrid " Load a colorscheme

nnoremap <silent>\t :colorscheme Tomorrow-Night-Eighties<CR>
nnoremap <silent>\j :colorscheme jellybeans<CR>
nnoremap <silent>\h :colorscheme hybrid<CR>
if has('gui_running')
    nnoremap <silent>\t :colorscheme Tomorrow-Night<CR>
    nnoremap <silent>\s :colorscheme solarized<CR>
endif

if has('gui_running')
    if has('gui_gtk')
        set guifont=DejaVu\ Sans\ Mono\ 11
    elseif has('gui_macvim')
        set guifont=Monaco:h11
    elseif has('gui_win32')
        set guifont=Consolas:h11:cANSI
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

" Indent setting for html
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

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

" LESS
augroup ft_less
    autocmd!
    autocmd filetype less nnoremap <buffer> <Leader>r :w <BAR> !lessc % > %:t:r.css<CR><Space>
augroup END

" JSON
augroup ft_json
    autocmd!
    " Disable concealing of double quotes
    autocmd filetype json setlocal conceallevel=0
    " Added folding of {...} and [...] blocks
    autocmd filetype json setlocal foldmethod=syntax
augroup END

" Python
augroup ft_python

    " Indent Python in the Google way.
    let s:maxoff = 50 " maximum number of lines to look backwards.
    function! GetGooglePythonIndent(lnum)
        " Indent inside parens.
        " Align with the open paren unless it is at the end of the line.
        " E.g.
        "   open_paren_not_at_EOL(100,
        "                         (200,
        "                          300),
        "                         400)
        "   open_paren_at_EOL(
        "       100, 200, 300, 400)
        call cursor(a:lnum, 1)
        let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
                    \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
                    \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
                    \ . " =~ '\\(Comment\\|String\\)$'")
        if par_line > 0
            call cursor(par_line, 1)
            if par_col != col("$") - 1
                return par_col
            endif
        endif
        " Delegate the rest to the original function.
        return GetPythonIndent(a:lnum)
    endfunction

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

    let pyindent_nested_paren="&sw*2"
    let pyindent_open_paren="&sw*2"

    autocmd!
    autocmd filetype python setlocal indentexpr=GetGooglePythonIndent(v:lnum)
    autocmd filetype python nnoremap <buffer> <Leader>r :call ChoosePythonCompiler()<CR>

augroup END

" Perl
augroup ft_perl
    let perl_include_pod=1
    let perl_extended_vars=1
    let perl_sync_dist=250
    autocmd!
    autocmd filetype perl setlocal keywordprg=perldoc\ -f
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
nnoremap Vaa ggVG

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
        normal! A 
        :call NERDComment('n', 'Append')
    endif
endfunction
nnoremap <silent>\<Space> :call IsWhiteLine()<CR>

" Strip all trailing whitespace in the current file
nnoremap <Leader>q :%s/\s\+$//<CR>:let @/=''<CR>

" See the differences between the current buffer and the file it was loaded from
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
    \ | diffthis | wincmd p | diffthis

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Local Setting
"--------------------------------------------------

" Use local vimrc if available
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" Use local gvimrc if available and gui is running
if has('gui_running')
    if filereadable(expand("~/.gvimrc.local"))
        source ~/.gvimrc.local
    endif
endif

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

nnoremap <Leader>d :NERDTreeTabsToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeDirArrows=1
let g:nerdtree_tabs_open_on_gui_startup=0

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
let g:neocomplcache_enable_auto_delimiter=1
let g:neocomplcache_enable_camel_case_completion=1
let g:neocomplcache_enable_underbar_completion=1

let g:snips_author='Xiao-Ou Zhang <kepbod@gmail.com>'

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory="$HOME/.vim/bundle/vim-snippets/snippets"
let g:neosnippet#enable_snipmate_compatibility=1

" Plugin key-mappings
imap <C-K> <Plug>(neosnippet_expand_or_jump)
smap <C-K> <Plug>(neosnippet_expand_or_jump)
xmap <C-K> <Plug>(neosnippet_expand_target)

" Map <C-E> to cancel completion
inoremap <expr><C-E> neocomplcache#cancel_popup()

" @date 2013/7/13 hawk
" Add PHPDictory
au FileType php call AddPHPFuncList()
function! AddPHPFuncList()
    set dictionary-=~/.vim/dict/php_funclist.txt dictionary+=~/.vim/dict/php_funclist.txt
    set complete-=k complete+=k
endfunction

" SuperTab like snippets behavior
inoremap <expr><Tab> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-N>" : "\<Tab>"
snoremap <expr><Tab> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-P>" : "\<S-Tab>"

" CR/S-CR: close popup and save indent
inoremap <expr><CR> delimitMate#WithinEmptyPair() ? "\<C-R>=delimitMate#ExpandReturn()\<CR>" : pumvisible() ? neocomplcache#close_popup() : "\<CR>"
inoremap <expr><S-CR> pumvisible() ? neocomplcache#close_popup() "\<CR>" : "\<CR>"

" For snippet_complete marker
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => delimitMate
"--------------------------------------------------

let delimitMate_expand_cr=1
let delimitMate_expand_space=1
let delimitMate_balance_matchpairs=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Ag(Ack)
"--------------------------------------------------

if executable('ag')
    nnoremap <Leader>a :Ag<Space>
elseif executable('ack-grep') || executable('ack')
    nnoremap <Leader>a :Ack!<Space>
endif
if !executable('ag') && has('unix') && executable('ack-grep')
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
" => fugitive
"--------------------------------------------------

if executable('git')
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Gundo
"--------------------------------------------------

if has('python')
    nnoremap <Leader>u :GundoToggle<CR>
endif

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
" => GoldenView
"--------------------------------------------------

let g:goldenview__enable_default_mapping=0
nmap <silent> <C-O> <Plug>GoldenViewSplit
nmap <silent> <C-G> <Plug>GoldenViewSwitchToggle
nmap <silent> <C-H> <Plug>GoldenViewNext
nmap <silent> <C-L> <Plug>GoldenViewPrevious

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Splitjoin
"--------------------------------------------------

let g:splitjoin_split_mapping = ',k'
let g:splitjoin_join_mapping = ',j'
let g:splitjoin_normalize_whitespace=1
let g:splitjoin_align=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Unite
"--------------------------------------------------

nnoremap <Leader>m :Unite<Space>
let g:unite_update_time=4000

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => vimux
"--------------------------------------------------

nnoremap <Leader>vp :VimuxPromptCommand<CR>
vnoremap <Leader>vs "vy :call VimuxRunCommand(@v . "\n", 0)<CR>
nnoremap <Leader>vx :VimuxClosePanes<CR>
nnoremap <Leader>vq :VimuxCloseRunner<CR>
nnoremap <Leader>vi :VimuxInspectRunner<CR>
nnoremap <Leader>vl :VimuxRunLastCommand<CR>
nnoremap <Leader>vc :VimuxClearRunnerHistory<CR>
" Fix bug in ruby 1.9
ruby << EOF
class Object
  def flush; end unless Object.new.respond_to?(:flush)
end
EOF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
