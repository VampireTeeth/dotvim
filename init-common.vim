set nocompatible
filetype on
filetype plugin on
filetype plugin indent on

syntax on

set nobackup
set noswapfile
set fileformat=unix
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmode=longest,list,full
set wildmenu

" Better complet options
set completeopt=longest,menuone
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
set smartindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

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
set notimeout ttimeout ttimeoutlen=1000

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

set cursorline cursorcolumn
set wrap

scriptencoding utf-8
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.


"Using relativenumber
set relativenumber

"Using shallslash
set shellslash

"colorscheme zenburn
"colorscheme koehler
colorscheme onedark

hi Normal ctermfg=none ctermbg=none
hi NonText ctermbg=none
hi Pmenu ctermfg=white ctermbg=black guibg=black

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
let g:SuperTabDefaultCompletionType = '<C-x><C-i>'


"showing shady characters
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~,space:\uB7,eol:$"
set list

"completeopt configuration
set completeopt=longest,menuone

"ctrlp max file limit -- no limit
let g:ctrlp_max_files=0
let g:ctrlp_working_path_mode='w'

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
  "let files = expand("%:p:h") . '/**/*.' . type
  let files = expand(".") . '/**/*.' . type
  call SearchPatternInFiles(pattern, files)
endfu

fu! SearchSelectionInFilesOfTheSameType()
  let pattern = '/' . GetSelectionText() . '/gj'
  "let files = expand("%:p:h") . '/**/*.' . expand("%:e")
  let files = expand(".") . '/**/*.' . expand("%:e")
  call SearchPatternInFiles(pattern, files)
endfu

fu! SearchWordUnderCursorInFiles()
  let pattern = '/' . expand("<cword>") . '/gj'
  "let files = expand("%:p:h") . '/**/*.*'
  let files = expand(".") . '/**/*.*'
  call SearchPatternInFiles(pattern, files)
endfu

fu! SearchSelectionInFiles()
  let pattern = '/' . GetSelectionText() . '/gj'
  "let files = expand("%:p:h") . '/**/*.*'
  let files = expand(".") . '/**/*.*'
  call SearchPatternInFiles(pattern, files)
endfu

fu! SearchCWordInAck()
    let pattern = expand("<cword>")
    let cmd = "Ack " . pattern " ./"
    exe cmd
endfu

fu! SearchSelectionInAck()
    let pattern = GetSelectionText()
    let cmd = "Ack " . pattern " ./"
    exe cmd
endfu


fu! SetIndentations(num)
  let num = a:num
  let &shiftwidth=num
  let &softtabstop=num
  let &tabstop=num
  set expandtab
endfu

" Configuration for lightline
fu! ConfigLightline()
  let g:lightline = {
        \ 'active': {
          \ 'left': [ [ 'mode', 'paste' ],
          \           [ 'readonly', 'relativepath', 'modified' ] ],
          \ 'right': [ [ 'lineinfo' ],
          \            [ 'percent' ],
          \            [ 'fileformat', 'fileencoding', 'filetype' ] ] } }
endfu
call ConfigLightline()

" All hooks
augroup hooks
  autocmd!
  autocmd BufRead,BufNewFile ~/.xmonad/* call s:add_xmonad_path()
  autocmd FileType tagbar setlocal cursorline
  autocmd FileType python call SetIndentations(2)
  autocmd BufRead,BufNewFile html,xhtml,xml call SetFtXml()
  "autocmd BufEnter * silent! lcd %:p:h
  "au FileType go set noexpandtab
  "au FileType go set shiftwidth=4
  "au FileType go set softtabstop=4
  "au FileType go set tabstop=4
augroup END

if executable('ag')
    " Use ag (the silver searcher)
    " https://github.com/ggreer/the_silver_searcher
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
                \ '-i --line-numbers --nocolor ' .
                \ '--nogroup --hidden --ignore ' .
                \ '''.hg'' --ignore ''.svn'' --ignore' .
                \ ' ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''

endif
