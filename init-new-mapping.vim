set nocompatible
filetype on
filetype plugin on
filetype plugin indent on

syntax on

set nobackup
set noswapfile
set fileformat=dos
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set nohlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

set cursorline cursorcolumn
set wrap

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

colorscheme koehler

hi Normal ctermfg=none ctermbg=none
hi NonText ctermbg=none
hi Pmenu ctermfg=white ctermbg=black guibg=black

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
let g:SuperTabDefaultCompletionType = '<C-x><C-i>'

"ctrlp max file limit -- no limit
let g:ctrlp_max_files=0 

fu! GetSelectionText()
  exe 'normal! gv"ay'
  return getreg("a")
endfu


fu! SetFtXml()
  set filetype=xml
endfu

function! SearchPatternInFiles(pattern, files)
  let cmd = "vimgrep " . a:pattern . " " . a:files
  echom "Executing: " . cmd . " ..."
  exe cmd
endfunction

fu! SearchWordUnderCursorInFilesOfTheSameType()
  let pattern = '/' . expand("<cword>") . '/gj'
  let type = expand("%:e")
  let files = expand("%:p:h") . '/**/*.' . type
  call SearchPatternInFiles(pattern, files)
endfu

fu! SearchSelectionInFilesOfTheSameType()
  let pattern = '/' . GetSelectionText() . '/gj'
  let files = expand("%:p:h") . '/**/*.' . expand("%:e")
  call SearchPatternInFiles(pattern, files)
endfu

nnoremap <leader>* :call SearchWordUnderCursorInFilesOfTheSameType()<CR><CR>:copen<CR>
vnoremap <leader>* :call SearchSelectionInFilesOfTheSameType()<CR><CR>:copen<CR>


fu! SetIndentations()
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2
  set expandtab
endfu

" All hooks
augroup hooks
  autocmd!
  autocmd BufRead,BufNewFile ~/.xmonad/* call s:add_xmonad_path()
  autocmd FileType tagbar setlocal cursorline
  autocmd FileType python call SetIndentations()
  autocmd BufRead,BufNewFile *.html,*.xhtml,*.xml call SetFtXml()
augroup END





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
nnoremap <leader>J <C-w>j
nnoremap <leader>K <C-w>k
nnoremap <leader>H <C-w>h
nnoremap <leader>L <C-w>l
nnoremap <leader>O <C-w>o
nnoremap <leader>= <C-w>=
nnoremap <leader>v <C-v>
nnoremap <leader>bd :Bd<CR>
vnoremap <leader>" di""<ESC>hp
vnoremap <leader>y "+y
vnoremap <leader>p "+p

inoremap <ESC> <ESC>
inoremap <M-o> <C-x><C-o>
inoremap <M-l> <C-x><C-l>
inoremap <M-n> <C-x><C-n>
inoremap <M-p> <C-x><C-f>

inoremap <expr> <M-j> pumvisible() ? "\<Down>" : "\<C-n>"
inoremap <expr> <M-k> pumvisible() ? "\<Up>" : "\<C-p>"


