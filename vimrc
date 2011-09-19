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

set nowrapscan
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
set hid " allow to change buffer without saving 

" disable menu & toolbar
"set guioptions-=m
"set guioptions-=T

" indent options
"  see help cinoptions-values for more details
set	cinoptions=>s,e0,n0,f0,{0,}0,^0,:0,=s,l0,b0,g0,hs,ps,ts,is,+s,c3,C0,0,(0,us,U0,w0,W0,m0,j0,)20,*30
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

nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>

nnoremap / /\v
vnoremap / /\v

" go to the directory of current editing file in NerdTree
nnoremap <leader>opwd :NERDTree %:p:h<CR>

nnoremap <leader>cn :cn<cr>
nnoremap <leader>cp :cp<cr>

"yank the line above current line
noremap <C-F> <esc>k<esc>yyp
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

" let g:wikiPath = g:vimwiki_list.path
let g:wikiPath = g:vimwiki_list[0].path
function! GotoWikiDir()
    let wikiPath = $HOME.'mywiki'
    exec 'lcd '.wikiPath
endfunction

cnoremap <silent> wiki :call GotoWikiDir()<cr>

function OpenPwdInNerdTree()
    let pwd = getcwd()
    exec 'NERDTree '.pwd
    echo pwd
endfunction

nnoremap <silent> <Leader>cd :call OpenPwdInNerdTree()<cr>

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
  nmap ,cs :let @*=substitute(expand("%:t"), "/", "\\", "g")<CR>
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
cnoremap Term :ConqueTermTab cmd.exe<Esc>

let g:UltiSnipsSnippetsDir="$HOME/myvim/bundle/UltiSnips-1.4/UltiSnips"

nnoremap <leader>es <C-w><C-v><C-l>:UltiSnipsEdit<cr>

let g:UltiSnipsExpandTrigger="<tab>"      
let g:UltiSnipsListSnippets="<c-tab>"       
let g:UltiSnipsJumpForwardTrigger="<tab>" 
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
