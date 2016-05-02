" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


"------------------------------------------------------------

"Window size settings
"set nofu
"set lines=80 columns=125

"Font size settings
"set guifont=Consolas:h14

"Key mappings

nnoremap <space> <nop>
let mapleader = "\<space>"

command Bd b#<bar>bd#

nnoremap <leader>tb :Tagbar<CR>
nnoremap <leader>tt :NERDTreeToggle<CR>
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>1 :tabprevious<CR>
nnoremap <leader>2 :tabnext<CR>
nnoremap <leader>3 :bprevious<CR>
nnoremap <leader>4 :bnext<CR>
nnoremap <leader>qf :copen<CR>
nnoremap <leader>yc :YcmCompleter GoTo<CR>

nnoremap <leader>ZZ :bd %<CR>
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>
nnoremap <leader>" viw<ESC>a"<ESC>hbi"<ESC>lel
nnoremap <leader>k <C-u> 
nnoremap <leader>j <C-d>
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wh <C-w>h
nnoremap <leader>wl <C-w>l
nnoremap <leader>wo <C-w>o
nnoremap <leader>= <C-w>=
nnoremap <leader>v <C-v>
nnoremap <leader>bd :Bd<CR>
vnoremap <leader>" di""<ESC>hp

nnoremap <leader>y :"+y<CR>
vnoremap <leader>y "+y
vnoremap <leader>p "+p

inoremap <ESC> <ESC>
inoremap <M-o> <C-x><C-o>
inoremap <M-l> <C-x><C-l>
inoremap <M-n> <C-x><C-n>
inoremap <M-p> <C-x><C-f>

inoremap <expr> <M-j> pumvisible() ? "\<Down>" : "\<C-n>"
inoremap <expr> <M-k> pumvisible() ? "\<Up>" : "\<C-p>"


