set runtimepath=$HOME/myvim,$VIMRUNTIME

if has("gui_running")
    silent exec "colorscheme molokai"
endif

source $HOME/myvim/bundle/pathogen/autoload/pathogen.vim

call pathogen#infect('$HOME/myvim/bundle')

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
autocmd!

source $HOME/myvim/exvimrc
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,latin1

filetype on " enable file type detection 
filetype plugin on " enable loading the plugin for appropriate file type 

:let mapleader = ","
:let maplocalleader =","

set sessionoptions += "globals"
set dictionary=$HOME/myvim/words.txt

"open my dictionary file
nnoremap <leader>ed <C-w><C-v><C-l>:e $HOME/myvim/words.txt<cr>

iabbr hwo how
iabbr fro for
iabbr teh the

"quicker for something like :w
nnoremap ; :

if has ("mac")
    set wildignore=*.o,*.obj,*.pyc,*.xib,*.png,*.jpg,*.icns,*.pva,*.pdf,*.zip,*.rar,*.eml,*.sj,*.pys,*.m4a,*.tif
else
    set wildignore=*.o,*.obj,*.pyc,*.swp,*.ico,*.pdb,*.ilk,*.dep,*.obmp
endif


set nowrapscan
" insert tabs on the start of a line according to
"shiftwidth, not tabstop
set smarttab
set copyindent    " copy the previous indentation on autoindenting
set history=200 " keep 50 lines of command line history
syn on
set tabstop=4
set sw=4
set expandtab
set ai
set si
set showmode
set showcmd
set hlsearch
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set relativenumber
set incsearch
set ignorecase
set smartcase
set gdefault
set showmatch
"set undofile
set wildmenu " turn on wild menu, try typing :h and press <Tab> 
set showcmd	" display incomplete commands
set cmdheight=1 " 1 screen lines to use for the command-line 
set ruler " show the cursor position all the time
set hidden " allow to change buffer without saving 

"watch out.. no backup will be saved
set nobackup
set noswapfile

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" set pastetoggle=<F12>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

nnoremap <space> <C-F>
nnoremap <BS> <C-B>

" disable menu & toolbar
"set guioptions-=m
"set guioptions-=T

" indent options
"  see help cinoptions-values for more details
set	cinoptions=>s,e0,n0,f0,{0,}0,^0,:0,=s,l0,b0,g0,hs,ps,ts,is,+s,c3,C0,0,(0,us,U0,w0,W0,m0,j0,)20,*30,N-s
" default '0{,0},0),:,0#,!^F,o,O,e' disable 0# for not ident preprocess
" set cinkeys=0{,0},0),:,!^F,o,O,e

set viminfo=%,'50,\"100,n~/.viminfo
set tags=tags;/
set nocompatible
nmap <Leader>f :LookupFile<CR>
nmap <Leader>bx :EXB<CR>

nmap <Leader>lp `[v`]

if has ("mac")
    set gfn=Monaco:h12
else
    set gfn=Monaco:h10
endif

set clipboard=unnamed
set thesaurus+=$HOME/vimfiles/thesaur.txt
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [ASCII=\%3.3b]\ [HEX=\%02.2B]\ [POS=%4l,%4v]\ [%p%%]\ [LEN=%L]
set laststatus=2

"search all the lines match the current word under cursor in the whole file and 
"list them in tne quickfix window
nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>

nnoremap / /\v
vnoremap / /\v

" go to the directory of current editing file in NerdTree
function OpenPathForCurrentFile()
    let path = expand("%:p:h")
    exec 'NERDTree '.path
    echo path
endfunction
" nnoremap <leader>opwd :NERDTree %:p:h<CR>
:command -nargs=0 GoHere :call OpenPathForCurrentFile()

nnoremap <leader>cn :cn<cr>
nnoremap <leader>cp :cp<cr>

"yank the line above current line and paste it
inoremap <C-S> <esc>k<esc>yyp
nnoremap <C-S> kyyp

"quicker escaping
inoremap jj <ESC>

"clear the highlight for previous search
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

"paste the content in unnamed register to the end of current line
nmap <Leader>$p A<space><esc>p<esc>

"paste the content in unnamed register to the beginning of current line
nmap <Leader>^p I<space><esc>P<esc>

"paste the content in unnamed register above the current line
nmap <Leader>P O<esc>p<esc>

"paste the content in unnamed register below the current line
nmap <Leader>p o<esc>p<esc>

"strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"open vimrc file in vertical window
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" When vimrc is edited, reload it
"not working...
"autocmd! bufwritepost vimrc source $MYVIMRC<cr>

"split the window vertically
nnoremap <leader>w <C-w>v<C-w>l

"Pressing ,ss will toggle and untoggle spell checking
map <leader>sp :setlocal spell!<cr>

"window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"zoom window
nnoremap <C-o> :ZoomWin<cr>

map <F2> :NERDTreeToggle<cr>
nnoremap <F5> :GundoToggle<CR>

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
map <leader>o :BufExplorer<cr>

map <F3> :ExpjSelectToggle<cr>
nnoremap <unique> <leader>ms :ExmbToggle<CR>
nnoremap <unique> <F6> :EXBufExplorer<CR>:redraw<CR>
nnoremap <unique> <Leader>qf :ExqfSelectToggle<CR>
nnoremap <unique> <leader>bk :EXAddBookmarkDirectly<CR>

"settings for vimwiki
let g:vimwiki_list = [{'path': $HOME.'/mywiki',  
  \ 'path_html': $HOME.'/mywiki_html',
  \ 'diary_link_count': 5},
  \ {'path': $HOME.'/workwiki',
  \ 'path_html' : $HOME.'/workwiki_html'}]

let g:vimwiki_camel_case = 0

let g:wikiPath = g:vimwiki_list[0].path
function! GotoWikiDir()
    let wikiPath = $HOME.'/mywiki'
    exec 'lcd '.wikiPath
endfunction

:command -nargs=0 Wiki :call GotoWikiDir()

function OpenPwdInNerdTree()
    let pwd = getcwd()
    exec 'NERDTree '.pwd
    echo pwd
endfunction

"open current directory in NerdTree
:command -nargs=0 Pwd :call OpenPwdInNerdTree()
" nnoremap <silent> <Leader>cd :call OpenPwdInNerdTree()<cr>

" settings for YankRing
let g:yankring_max_history = 1000
let g:yankring_min_element_length = 2
nnoremap <silent> <F7> :YRShow<CR>

"make sure that when press enter on a line in quickfix window,
"the cursor will stay in quickfix window
augroup vimrcQFCRFix
    " Prevent making duplicate autocommands
    autocmd!
    autocmd Filetype qf nnoremap <buffer> <CR> <CR><C-w>p
augroup END

:command -nargs=1 WS :vimgrep <args> g:wikiPath.'/*.wiki'

"scientific calculator
:command! -nargs=+ Calc :py print <args>
:py from math import *

nnoremap <unique> <leader>js :ExjsToggle<CR>
nnoremap <unique> <leader>ss :ExslSelectToggle<CR>

if has('win32')
  "copy just filename for the file under edit to clipboard
  nmap ,cs :let @*=substitute(expand("%:t"), "/", "\\", "g")<CR>

  "copy filename with path for the file under edit to clipboard
  nmap ,cl :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
else
  nmap ,cs :let @*=expand("%:t")<CR>
  nmap ,cl :let @*=expand("%")<CR>
endif

nnoremap <silent> <leader>lf :LUTags<cr>
nnoremap <silent> <leader>lb :LUBufs<cr>
nnoremap <silent> <leader>lw :LUWalk<cr>

noremap <C-Tab> :tabn<cr>

let g:ConqueTerm_PromptRegex = '^\w\+@[0-9A-Za-z_.-]\+:[0-9A-Za-z_./\~,:-]\+\$'
let g:ConqueTerm_CWInsert = 1
:command -nargs=0 Term :ConqueTermTab cmd.exe<Esc>

let g:UltiSnipsSnippetsDir="$HOME/myvim/bundle/UltiSnips-1.5/UltiSnips"

nnoremap <leader>es <C-w><C-v><C-l>:UltiSnipsEdit<cr>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>" 
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:EasyMotion_mapping_t  = '_t'

call CountJump#TextObject#MakeWithCountSearch('', '/', 'ai', 'v', '\\\@<!/', '\\\@<!/')

let g:session_autoload='prompt'
" let g:session_default_to_last=1

" Center display line after searches
nnoremap n   nzz
nnoremap N   Nzz

"disabled because conflict with mark.vim plugin
" nnoremap *   *zz
" nnoremap #   #zz
"nnoremap g*  g*zz
"nnoremap g#  g#z

" imap <Leader>ymd   <C-R>=strftime("%y%m%d")<CR>
" imap <Leader>mdy   <C-R>=strftime("%m/%d/%y")<CR>
" imap <Leader>ndy   <C-R>=strftime("%b %d, %Y")<CR>
" imap <Leader>hms   <C-R>=strftime("%T")<CR>
" imap <Leader>ynd   <C-R>=strftime("%Y %b %d")<CR>

if has("win32")
    :command -nargs=0 Log :call ExecuteCommand("TortoiseProc.exe /command:log /path:", "%")
    :command -nargs=0 Diff :call ExecuteCommand("TortoiseProc.exe /command:diff /path:", "%")

    "simple wrapper so we can pass argument to TortoiseSvn
    "by showgood
    function! ExecuteCommand(command, arg)
        let cmd = a:command
        if a:arg == "%"
            let cmd .= expand("%")
        else
            let cmd .= a:arg
        endif
        echo cmd
        call xolox#shell#execute(cmd, 0)
    endfunction

endif

"redefine mappings for vim-shell plugin
"because it conflicts with commentify
let g:shell_mappings_enabled=0
inoremap <F12> <C-o>:Fullscreen<CR>
nnoremap <F12> :Fullscreen<CR>
inoremap <C-F12> <C-o>:Maximize<CR>
nnoremap <C-F12> :Maximize<CR>

"function which use beyond compare to compare
"two files currently opened in two windows
"must have two windows opened
"the path for beyond compare must be put
"in the PATH environment variable
"by showgood
function CompareTwoFiles()
    if winbufnr(2) == -1
        echo "only one window.."
        return
    endif

    if winbufnr(3) != -1
        echo "more than two windows.."
        return
    endif

    let buf_a  = bufname(winbufnr(1))
    let buf_b  = bufname(winbufnr(2))
    let file_a = fnamemodify(buf_a, ":p")
    let file_b = fnamemodify(buf_b, ":p")

    let command  = "BComp.exe ". file_a . " " . file_b

    call xolox#shell#execute(command, 0)
endfunction

:command -nargs=0 Comp :call CompareTwoFiles()

nnoremap Y y$

let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window

"make change a word with copied text easier
nnoremap s diw"0P
vnoremap s "_d"0P

"make jump to exact cursor position of a mark easier
nnoremap ' `
