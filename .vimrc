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
set noro

set mouse=a
set mousem=popup
set mousehide "Hide mouse when typing

set guioptions-=m "remove menu bar
set guioptions-=T "remove toolbar
set guioptions+=b
set guioptions+=LlRrb
set guioptions-=LlRrb
set cursorline

if !has('gui_running')
  set t_Co=256
else
  set guifont=Menlo\ Regular:h14
endif

colo mirodark
hi NonText ctermfg=black guifg=#121212

"sets tabexpand to spaces
set linespace=4
set et
set sw=4
set sts=4
set smarttab

autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
autocmd FileType php set ai sw=4 sts=4 et
autocmd FileType go set ai ts=4
autocmd Filetype gitcommit setlocal spell textwidth=72

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

"Map escape key to jk -- much faster
imap jk <esc>

"Disable F1
map <F1> <Esc>
imap <F1> <Esc>

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

"Easy navigation between splits
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

"clear search
nmap <silent> ,/ :nohlsearch<CR>

"Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"Current dir as %%
cnoremap %% <C-R>=expand('%:h').'/'<cr>

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''

let g:airline_mode_map = {
\ '__' : '-',
\ 'n'  : 'N',
\ 'i'  : 'I',
\ 'R'  : 'R',
\ 'c'  : 'C',
\ 'v'  : 'V',
\ 'V'  : 'V',
\ 's'  : 'S',
\ 'S'  : 'S',
\ }

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.branch = '⎇'

let NERDTreeShowHidden=1 "Show hidden files in NerdTree
let g:NERDTreeWinPos = "right"
let g:NERDTreeChDirMode=1
map <F2> :NERDTreeMirrorToggle<CR>

"toggle paste mode
set pastetoggle=<F3>

"toggle yankring
map <Leader>r <Esc>:YRShow<CR>

"toggle CtrlP
let g:ctrlp_map = ',e'
let g:ctrlp_cmd = 'CtrlPMixed'
nnoremap <leader>t :CtrlPTag<cr>
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

"SplitJoin map
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

"Switch map
nnoremap - :Switch<cr>

let html_no_rendering=1

"Splits
map <Leader>s :vsp<CR>
map <Leader>x :q<CR>

nnoremap <leader><leader> <c-^>

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

"Map omnicomplete to ctrl+space
imap <c-space> <c-x><c-o>

set omnifunc=syntaxcomplete#Complete

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"Rails specific
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! bundle exec rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>

nnoremap <leader>a :A<CR>
nnoremap <leader>R :R<CR>

vmap <Leader>t :call I18nTranslateString()<CR>

"Edit routes
function! EditRoutes()
  :Rcd
  :topleft 30 :split config/routes.rb
endfunction
map <leader>gr :call EditRoutes()<cr>

"Rspec
if has('gui_running')
  let g:rspec_command = "!bundle exec rspec --no-color -I . -f d {spec}"
else
  let g:rspec_command = "!bundle exec rspec --color -I . -f d {spec}"
endif

function! WrapRunCurrentSpecFile()
  :Rcd
  :call RunCurrentSpecFile()
endfunction

function! WrapRunLastSpec()
  :Rcd
  :call RunLastSpec()
endfunction

function! WrapRunAllSpecs()
  :Rcd
  :call RunAllSpecs()
endfunction

map <Leader>t :call WrapRunCurrentSpecFile()<CR>
map <Leader>l :call WrapRunLastSpec()<CR>
map <Leader>A :call WrapRunAllSpecs()<CR>

" Source the vimrc file after saving it. This way, you don't have to reload
" Vim to see the changes.
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
