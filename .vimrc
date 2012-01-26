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

" colorscheme lombard
colorscheme solarized
set background=dark

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

"shortcuts

" change the mapleader from \ to ,
let mapleader=","

"Map escape key to jj -- much faster
imap jj <esc>
imap ?? <?=?><esc>hi

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
map <F2> :NERDTreeToggle<CR>

"Map code completion to Ctrl+Space
imap <C-Space> <C-x><C-o>

"http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Source the vimrc file after saving it. This way, you don't have to reload
" Vim to see the changes.
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
