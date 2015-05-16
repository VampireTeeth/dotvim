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
"map <S-h> <C-w>h
"map <S-j> <C-w>j
"map <S-k> <C-w>k
"map <S-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-o> <C-w>o
nnoremap <leader>tb :Tagbar<CR>
nnoremap <leader>tt :NERDTreeToggle<CR>
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>1 :tabprevious<CR>
nnoremap <leader>2 :tabnext<CR>
nnoremap <leader>3 :bprevious<CR>
nnoremap <leader>4 :bnext<CR>
nnoremap <leader>qf :copen<CR>
nnoremap <leader>jd :YcmCompleter GoTo<CR>

nnoremap <leader>ZZ :bd %<CR>
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>
nnoremap <leader>" viw<ESC>a"<ESC>hbi"<ESC>lel
nnoremap <leader>5 <C-u>
nnoremap <leader>6 <C-d>
vnoremap <leader>" di""<ESC>hp
inoremap <ESC> <ESC>


"Eclim Settings
nnoremap <leader>jjc :JavaConstructor<CR>
nnoremap <leader>jjg :JavaGet<CR>
nnoremap <leader>jjs :JavaSet<CR>
nnoremap <leader>jjp :JavaGetSet<CR>
nnoremap <leader>jjs :JavaSearch<CR>
nnoremap <leader>jjh :JavaCallHierarchy<CR>
nnoremap <leader>jji :JavaImport<CR>
nnoremap <leader>jjo :JavaImportOrganize<CR>
nnoremap <leader>jju :JUnit<CR>
