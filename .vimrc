"Init Pathogen
call pathogen#infect()

"Forget compatibility with Vi. Who cares.
set nocompatible

"Enable filetypes
filetype plugin indent on
syntax on

set showcmd "Show command in bottom right portion of the screen
set ruler "Fast copy+paste, select, etc.
set number
set smartindent
set autoindent
set copyindent
set showmatch " set show matching parenthesis
set foldenable
set nowrap

set mousem=popup
set mousehide "Hide mouse when typing

set guioptions-=m "remove menu bar
set guioptions-=T "remove toolbar
set guioptions+=b
set guioptions+=LlRrb
set guioptions-=LlRrb

if !has('gui_running')
  set t_Co=256
  colorscheme railscasts
else
  set guifont=Menlo\ Regular:h14
  colo codeschool
endif

"sets tabexpand to spaces
set linespace=4
set et
set sw=4
set sts=4
set smarttab

autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
autocmd FileType php set ai sw=4 sts=4 et

"Split windows below the current window.
set splitbelow
set splitright

set incsearch
set hlsearch
set ignorecase
set smartcase

set wildmenu
set wildmode=list:longest

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc
set title
set visualbell
set noerrorbells
set t_vb=

set nobackup
set noswapfile

autocmd BufEnter * cd %:p:h "Automatically change current directory to that of the file in the buffer
autocmd BufWritePre * :%s/\s\+$//e "strip trailing whitespace

"shortcuts

"change the mapleader from \ to ,
let mapleader=","

"Map escape key to jj -- much faster
imap jj <esc>

imap ?? <?=?><esc>hi
imap %% <%=  %><esc>hhi

"Align => with ,ta
vmap ,ta :Align =><CR>

"Tab navigation like firefox
:nmap <C-S-tab> :tabprevious<CR>
:nmap <C-tab> :tabnext<CR>
:map <C-S-tab> :tabprevious<CR>
:map <C-tab> :tabnext<CR>
:imap <C-S-tab> <Esc>:tabprevious<CR>i
:imap <C-tab> <Esc>:tabnext<CR>i
:nmap <C-t> :tabnew<CR>
:imap <C-t> <Esc>:tabnew<CR>

"clear search
nmap <silent> ,/ :nohlsearch<CR>

"Move
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

"Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

let g:airline_left_sep = ''
let g:airline_right_sep = ''

let NERDTreeShowHidden=1 "Show hidden files in NerdTree
let g:NERDTreeWinPos = "right"
let g:NERDTreeChDirMode=1
map <F2> :NERDTreeMirrorToggle<CR>

"Toggle Tagbar
nmap <F8> :TagbarToggle<CR>

"toggle paste mode
set pastetoggle=<F3>

"toggle yankring
map <Leader>r <Esc>:YRShow<CR>

nnoremap <D-A> <Esc>:A<CR>

"toggle CtrlP
let g:ctrlp_map = ',e'
let g:ctrlp_cmd = 'CtrlPMixed'
nnoremap <leader>t :CtrlPTag<cr>

"SplitJoin map
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

"Switch map
nnoremap - :Switch<cr>

"i18n
vmap <Leader>z :call I18nTranslateString()<CR>

"Map code completion to Ctrl+Space
imap <C-Space> <C-x><C-o>

let html_no_rendering=1

"open new empty split
map <Leader>s :vnew<CR>

"open nerdtree bookmark
map <D-P> :NERDTreeFromBookmark<space>

"git blame
map <Leader>b :Gblame<CR>

"http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

" Reconfigure vim-seek search key
let g:SeekKey = '<Space>'
let g:SeekBackKey = '<S-Space>'

" Config Switch
nnoremap - :Switch<CR>

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Source the vimrc file after saving it. This way, you don't have to reload
" Vim to see the changes.
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
