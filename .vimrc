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
set showmatch     " set show matching parenthesis
set foldenable
set nowrap
set lines=50 columns=180

set mousem=popup
set mousehide "Hide mouse when typing

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions+=b
set guioptions+=LlRrb
set guioptions-=LlRrb

if !has('gui_running')
  set t_Co=256
  colorscheme railscasts
else
  colorscheme solarized
  set background=dark
endif

"sets tabexpand to spaces
set linespace=4
set et
set sw=4
set sts=4
set smarttab

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
autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
autocmd FileType php set ai sw=4 sts=4 et

"shortcuts

" change the mapleader from \ to ,
let mapleader=","

"Map escape key to jj -- much faster
imap jj <esc>

imap ?? <?=?><esc>hi
imap %% <%=  %><esc>hhi

"Tab navigation like firefox
:nmap <C-S-tab> :tabprevious<CR>
:nmap <C-tab> :tabnext<CR>
:map <C-S-tab> :tabprevious<CR>
:map <C-tab> :tabnext<CR>
:imap <C-S-tab> <Esc>:tabprevious<CR>i
:imap <C-tab> <Esc>:tabnext<CR>i
:nmap <C-t> :tabnew<CR>
:imap <C-t> <Esc>:tabnew<CR>

"Move
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp

"clear search
nmap <silent> ,/ :nohlsearch<CR>

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

let NERDTreeShowHidden=1 "Show hidden files in NerdTree
map <F2> :NERDTreeMirrorToggle<CR>

"Map code completion to Ctrl+Space
imap <C-Space> <C-x><C-o>

"http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

call Pl#Theme#RemoveSegment('fileformat')

" Source the vimrc file after saving it. This way, you don't have to reload
" Vim to see the changes.
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
