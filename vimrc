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
"   Last Modified: 2013-11-07
"
"   Sections:
"     -> Ivim Setting
"     -> General
"     -> Platform Specific Configuration
"     -> NeoBundle
"     -> Vim User Interface
"     -> Colors and Fonts
"     -> Indent and Tab Related
"     -> Search Related
"     -> Fold Related
"     -> Filetype Specific
"     -> Key Mapping
"     -> Local Setting
"     -> Plugin Setting
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"------------------------------------------------
" => Ivim Setting
"------------------------------------------------

" Ivim user setting
let g:ivim_user="Xiao-Ou Zhang" " User name
let g:ivim_email="kepbod@gmail.com" " User email
let g:ivim_github="https://github.com/kepbod" " User github
" Ivim UI setting
let g:ivim_fancy_font=1 " Enable using fancy font
let g:ivim_show_number=1 " Enable showing number
" Ivim plugin setting
let g:ivim_bundle_groups=["ui", "enhance", "move", "navigate", "complete",
                         \"compile", "git"]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"------------------------------------------------
" => General
"------------------------------------------------

set nocompatible " Get out of vi compatible mode
filetype plugin indent on " Enable filetype
let mapleader="," " Change the mapleader
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
    let prefix=".vim"
    let dir_list={
                \ "backup": "backupdir",
                \ "view": "viewdir",
                \ "swap": "directory",
                \ "undo": "undodir",
                \ "cache": "",
                \ "session": ""}
    for [dirname, settingname] in items(dir_list)
        let directory=parent."/".prefix."/".dirname."/"
        if !isdirectory(directory)
            if exists("*mkdir")
                call mkdir(directory, "p")
            else
                echo "Warning: Unable to create directory: ".directory
            endif
        endif
        if settingname!=""
            exec "set ".settingname."=".directory
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

" On Windows, also use .vim instead of vimfiles
if has("win32") || has("win64")
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

set viewoptions+=slash,unix " Better Unix/Windows compatibility
set viewoptions-=options " in case of mapping change
set fileformats=unix,mac,dos " Auto detect the file formats

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => NeoBundle
"--------------------------------------------------

if has("vim_starting")
    set nocompatible
    set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand($HOME . "/.vim/bundle/"))

" Use NeoBundle to manager plugins
NeoBundleFetch "Shougo/neobundle.vim"

if count(g:ivim_bundle_groups, "ui") " UI setting
    NeoBundle "w0ng/vim-hybrid" " Colorscheme hybrid
    NeoBundle "bling/vim-airline" " Status line
    NeoBundle "bling/vim-bufferline" " Buffer line
    NeoBundle "nathanaelkane/vim-indent-guides" " Indent guides
    NeoBundle "mhinz/vim-startify" " Start page
endif

if count(g:ivim_bundle_groups, "enhance") " Vim enhancement
    NeoBundle "Raimondi/delimitMate" " Closing of quotes
    NeoBundle "scrooloose/nerdcommenter" " NERD commenter
    NeoBundle "tpope/vim-abolish" " Abolish
    NeoBundle "tpope/vim-speeddating" " Speed dating
    NeoBundle "tpope/vim-repeat" " Repeat
    NeoBundle "terryma/vim-multiple-cursors" " Multiple cursors
    NeoBundle "michaeljsmith/vim-indent-object" " Indent object
    NeoBundle "coderifous/textobj-word-column.vim" " Column object
    NeoBundle "mbbill/undotree" " Undo tree
endif

if count(g:ivim_bundle_groups, "move") " Moving
    NeoBundle "tpope/vim-unimpaired" " Pairs of mappings
    NeoBundle "Lokaltog/vim-easymotion" " Easy motion
    NeoBundle "bkad/CamelCaseMotion" " Camel case motion
    NeoBundle "zhaocai/GoldenView.Vim" " Manage windows
    NeoBundle "majutsushi/tagbar" " Tag bar
    NeoBundle "Shougo/unite.vim" " Search engine
    NeoBundle "Shougo/unite-outline" " Unite outline
    NeoBundle "Shougo/vimproc", {
                \ "build" : {
                \     "windows" : "make -f make_mingw32.mak",
                \     "cygwin" : "make -f make_cygwin.mak",
                \     "mac" : "make -f make_mac.mak",
                \     "unix" : "make -f make_unix.mak",
                \    },
                \ }
endif

if count(g:ivim_bundle_groups, "navigate") " Navigation
    NeoBundle "scrooloose/nerdtree" " NERD tree
    NeoBundle "jistr/vim-nerdtree-tabs" " NERD tree tabs
endif

if count(g:ivim_bundle_groups, "complete") " Completion
    if has("lua")
        NeoBundle "Shougo/neocomplete.vim" " Auto completion framework
        let g:ivim_completion_engine="neocomplete"
    else
        NeoBundle "Shougo/neocomplcache.vim" " Auto completion framework
        let g:ivim_completion_engine="neocomplcache"
    endif
    NeoBundle "Shougo/neosnippet.vim" " Snippet engine
    NeoBundle "honza/vim-snippets" " Snippets
endif

if count(g:ivim_bundle_groups, "compile") " Compiling
    NeoBundle "scrooloose/syntastic" " Syntax checking
endif

if count(g:ivim_bundle_groups, "git") " Git
    NeoBundle "tpope/vim-fugitive" " Git wrapper
    NeoBundle "gregsexton/gitv" " Gitk clone
    if has('signs')
        NeoBundle "airblade/vim-gitgutter" " Git diff sign
    endif
endif

if filereadable(expand($HOME . "/.vimrc.bundles.local")) " Load local bundles
    source $HOME/.vimrc.bundles.local
endif

filetype plugin indent on " Required!

NeoBundleCheck

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
    let s=""
    let t=tabpagenr() " The index of current page
    let i=1
    while i<=tabpagenr("$") " From the first page
        let buflist=tabpagebuflist(i)
        let winnr=tabpagewinnr(i)
        let s.=(i==t?"%#TabLineSel#":"%#TabLine#")
        let s.="%".i."T"
        let s.=" "
        let bufnr=buflist[winnr - 1]
        let file=bufname(bufnr)
        let m=""
        if getbufvar(bufnr, "&modified")
            let m="[+]"
        endif
        if file=~"\/."
            let file=substitute(file,".*\/\ze.","","")
        endif
        if file==""
            let file="[No Name]"
        endif
        let s.=m
        let s.=i.":"
        let s.=file
        let s.="[".winnr."]"
        let s.=" "
        let i=i+1
    endwhile
    let s.="%T%#TabLineFill#%="
    let s.=(tabpagenr("$")>1?"%999XX":"X")
    return s
endfunction
" Set up tab tooltips with every buffer name
set guitabtooltip=%F

" Set status line
if count(g:ivim_bundle_groups, "ui")
    set laststatus=2 " Show the statusline
    set noshowmode " Hide the default mode text
    let g:airline_theme="bubblegum"
    set ttimeoutlen=50
    let g:bufferline_echo=0
    let g:bufferline_modified="[+]"
    if g:ivim_fancy_font
        let g:airline_powerline_fonts=1
    else
        let g:airline_left_sep=""
        let g:airline_right_sep=""
    endif
endif

" Only have cursorline in current window and in normal window
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline
auto InsertEnter * set nocursorline
auto InsertLeave * set cursorline
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
" Use Tab instead of % to switch using matchit
nmap <Tab> %
vmap <Tab> %

if g:ivim_show_number
    set number " Show line numbers
    nnoremap <Leader>n :set regulativenumber! " Toggle relativenumber
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
if has("gui_running")
    set guioptions-=m
    set guioptions-=T
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Colors and Fonts
"-------------------------------------------------

syntax on " Enable syntax
set background=dark " Set background
if !has("gui_running")
    set t_Co=256 " Use 256 colors
endif

" Load a colorscheme
if count(g:ivim_bundle_groups, "ui")
    colorscheme hybrid
else
    colorscheme desert
endif

if has("gui_running")
    if has("gui_gtk")
        set guifont=DejaVu\ Sans\ Mono\ 11
    elseif has("gui_macvim")
        set guifont=Monaco:h11
    elseif has("gui_win32")
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
    let @/='\V'.substitute(escape(@@, '\'), '\n', '\n', 'g')
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
nnoremap <silent><Space> @=(foldlevel(".")?"za":"\<Space>")<CR>
vnoremap <Space> zf

" Set foldtext
function! MyFoldText()
    let line=getline(v:foldstart)
    let nucolwidth=&foldcolumn+&number*&numberwidth
    let windowwidth=winwidth(0)-nucolwidth-3
    let foldedlinecount=v:foldend-v:foldstart+1
    let onetab=strpart("          ", 0, &tabstop)
    let line=substitute(line, "\t", onetab, "g")
    let line=strpart(line, 0, windowwidth-2-len(foldedlinecount))
    let fillcharcount=windowwidth-len(line)-len(foldedlinecount)
    return line."…".repeat(" ",fillcharcount).foldedlinecount."…"." "
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
    autocmd Filetype markdown vnoremap <buffer> <LocalLeader>ol :s/^/\=(line(".")-line(""<")+1).". "/<CR>
    " Use <localLeader>e1/2/3 to add emphasis symbols
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e1 I*<ESC>A*<ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e2 I**<ESC>A**<ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e3 I***<ESC>A***<ESC>
    " Use <Leader>P to preview markdown file in browser
    autocmd Filetype markdown nnoremap <buffer> <Leader>P :MarkdownPreview<CR>
    " Turn on spell
    autocmd Filetype markdown setlocal spell
augroup END

" HTML
augroup ft_html
    " Indent setting for html
    let g:html_indent_inctags="html,body,head,tbody"
    let g:html_indent_script1="inc"
    let g:html_indent_style1="inc"
    autocmd!
    autocmd Filetype html setlocal spell " Turn on spell
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
        let [par_line, par_col] = searchpairpos("(\|{\|\[", "", ")\|}\|\]", "bW",
                    \ "line(".") < " . (a:lnum - s:maxoff) . " ? dummy :"
                    \ . " synIDattr(synID(line("."), col("."), 1), "name")"
                    \ . " =~ "\\(Comment\\|String\\)$"")
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
            call SingleCompile#ChooseCompiler("python", "python")
            execute "SingleCompileRun"
        elseif flag==50
            call SingleCompile#ChooseCompiler("python", "python3")
            execute "SingleCompileRun"
        endif
    endfunction

    let pyindent_nested_paren="&sw*2"
    let pyindent_open_paren="&sw*2"

    autocmd!
    autocmd filetype python setlocal indentexpr=GetGooglePythonIndent(v:lnum)
    autocmd filetype python nnoremap <buffer> <Leader>r :call ChoosePythonCompiler()<CR>
    autocmd fileType python let b:delimitMate_nesting_quotes = ['"']

augroup END

" Ruby
augroup ft_ruby
    autocmd!
    autocmd filetype ruby setlocal shiftwidth=2 softtabstop=2
augroup END

" Perl
augroup ft_perl
    let perl_include_pod=1
    let perl_extended_vars=1
    let perl_sync_dist=250
    autocmd!
    autocmd filetype perl setlocal keywordprg=perldoc\ -f
augroup END

" PHP
augroup ft_php
    if filereadable(expand($HOME . "/.vim/dict/php_funclist.txt"))
        function! AddPHPFuncList()
            set dictionary-=$HOME/.vim/dict/php_funclist.txt dictionary+=$HOME/.vim/dict/php_funclist.txt
            set complete-=k complete+=k
        endfunction
        autocmd!
        autocmd filetype php call AddPHPFuncList()
    endif
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
nnoremap Vaa ggVG

" Strip all trailing whitespace in the current file
nnoremap <Leader>q :%s/\s\+$//<CR>:let @/=""<CR>

" Modify all the indents
nnoremap \= gg=G

" See the differences between the current buffer and the file it was loaded from
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
            \ | diffthis | wincmd p | diffthis

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Local Setting
"--------------------------------------------------

" Use local vimrc if available
if filereadable(expand($HOME . "/.vimrc.local"))
    source $HOME/.vimrc.local
endif

" Use local gvimrc if available and gui is running
if has("gui_running")
    if filereadable(expand($HOME . "/.gvimrc.local"))
        source $HOME/.gvimrc.local
    endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Plugin Setting
"--------------------------------------------------

" Setting for UI plugins
if count(g:ivim_bundle_groups, "ui")

    " -> Indent Guides
    if !has('gui_running')
        let g:indent_guides_auto_colors=0
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=235
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
    endif
    let g:indent_guides_enable_on_vim_startup=1
    let g:indent_guides_guide_size=1
    let g:indent_guides_default_mapping=0
    let g:indent_guides_exclude_filetypes=['help', 'nerdtree', 'startify']

    " -> Startify
    let g:startify_session_dir=$HOME . "/.vim/session"
    let g:startify_custom_header=[
                \'       _       _         ',
                \'      (_)   __(_)___ ___ ',
                \'     / / | / / / __ `__ \',
                \'    / /| |/ / / / / / / /',
                \'   /_/ |___/_/_/ /_/ /_/ ',
                \'                         ']
    let g:startify_custom_footer=['', "    This configuration is maintained by Xiao-Ou Zhang<kepbod@gmail.com> and other contributors. Thanks!"]
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
if count(g:ivim_bundle_groups, "enhance")

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
        if (getline(".")=~"^$")
            let oldlinenumber=line(".")
            call NERDComment('n', 'sexy')
            if (line(".")==oldlinenumber)
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
    nnoremap <silent>\<Space> :call IsWhiteLine()<CR>

    " -> Undo tree
    nnoremap <Leader>u :UndotreeToggle<CR>
    let g:undotree_SetFocusWhenToggle=1

endif

" setting for moving plugins
if count(g:ivim_bundle_groups, "move")

    " -> Golden View
    let g:goldenview__enable_default_mapping=0
    nmap <silent> <C-O> <Plug>GoldenViewSplit
    nmap <silent> <C-F> <Plug>GoldenViewSwitchToggle

    " -> Tag bar
    nnoremap <Leader>t :TagbarToggle<CR>
    let g:tagbar_autofocus=1
    let g:tagbar_expand=1
    let g:tagbar_foldlevel=2
    let g:tagbar_autoshowtag=1

    " -> Unite
    let g:unite_data_directory=$HOME . "/.vim/cache/unite"
    let g:unite_source_history_yank_enable=1
    let g:unite_source_rec_max_cache_files=100
    if g:ivim_fancy_font
        let g:unite_prompt="» "
    endif
    if executable("ag")
        " Use ag in unite grep source.
        let g:unite_source_grep_command="ag"
        let g:unite_source_grep_default_opts="--line-numbers --nocolor --nogroup --hidden"
        let g:unite_source_grep_recursive_opt=""
    elseif executable("ack-grep")
        " Use ack-grep in unite grep source.
        let g:unite_source_grep_command="ack-grep"
        let g:unite_source_grep_default_opts="--no-heading --no-color -a -H"
        let g:unite_source_grep_recursive_opt=""
    elseif executable('ack')
        " Use ack in unite grep source.
        let g:unite_source_grep_command="ack"
        let g:unite_source_grep_default_opts="--no-heading --no-color -a -H"
        let g:unite_source_grep_recursive_opt=""
    endif
    function! s:unite_settings() " Use ESC to exit, and use C-J and C-K to move
        nmap <buffer> <ESC> <plug>(unite_exit)
        imap <buffer> <ESC> <plug>(unite_exit)
        imap <buffer> <C-J> <Plug>(unite_select_next_line)
        imap <buffer> <C-K> <Plug>(unite_select_previous_line)
    endfunction
    autocmd FileType unite call s:unite_settings()
    nnoremap <silent> <Space>f :<C-U>Unite -start-insert -auto-resize -buffer-name=files file_rec/async<CR><C-U>
    nnoremap <silent> <Space>y :<C-U>Unite -start-insert -buffer-name=yanks history/yank<CR>
    nnoremap <silent> <Space>l :<C-U>Unite -start-insert -auto-resize -buffer-name=line line<CR>
    nnoremap <silent> <Space>o :<C-U>Unite -auto-resize -buffer-name=outline outline<CR>
    nnoremap <silent> <Space>b :<C-U>Unite -quick-match buffer<CR>
    nnoremap <silent> <Space>t :<C-U>Unite -quick-match tab<CR>
    nnoremap <silent> <Space>/ :<C-U>Unite -auto-resize -buffer-name=search grep:.<CR>

endif

" Setting for navigation plugins
if count(g:ivim_bundle_groups, "navigate")

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

" Setting for compiling plugins
if count(g:ivim_bundle_groups, "compile")

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

endif

" Setting for completion plugins
if count(g:ivim_bundle_groups, "complete")

    " -> Neocomplete & Neocomplcache
    " Use Tab and S-Tab to select candidate
    inoremap <expr><Tab>  pumvisible() ? "\<C-N>" : "\<Tab>"
    inoremap <expr><S-Tab> pumvisible() ? "\<C-P>" : "\<S-Tab>"
    if g:ivim_completion_engine=="neocomplete"
        let g:neocomplete#enable_at_startup=1
        let g:neocomplete#data_directory=$HOME . "/.vim/cache/neocomplete"
        let g:neocomplete#enable_auto_delimiter=1
        " Use <C-E> to close popup
        inoremap <expr><C-E> neocomplete#cancel_popup()
        inoremap <expr> <CR> delimitMate#WithinEmptyPair() ?
                \ "\<C-R>=delimitMate#ExpandReturn()\<CR>" :
                \ pumvisible() ? neocomplete#close_popup() : "\<CR>"
    else
        let g:neocomplcache_enable_at_startup=1
        let g:neocomplcache_temporary_dir=$HOME . "/.vim/cache/neocomplcache"
        let g:neocomplcache_enable_auto_delimiter=1
        let g:neocomplcache_enable_fuzzy_completion=1
        " Use <C-E> to close popup
        inoremap <expr><C-E> neocomplcache#cancel_popup()
        inoremap <expr> <CR> delimitMate#WithinEmptyPair() ?
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

" Setting for git plugins
if count(g:ivim_bundle_groups, "git")
endif

"--------------------------------------------------
