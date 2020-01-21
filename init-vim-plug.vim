if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

Plug 'L9'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'flazz/vim-colorschemes'
Plug 'tomtom/tcomment_vim'
Plug 'FuzzyFinder'
Plug 'Shougo/vimproc'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimshell'
Plug 'kien/ctrlp.vim'
Plug 'tomasr/molokai'
Plug 'ervandew/supertab'
Plug 'msanders/snipmate.vim'
Plug 'Zenburn'
Plug 'gre/play2vim'
Plug 'othree/html5.vim'
Plug 'gtags.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Need to install fzf command
if executable("fzf")
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
endif

"Load language plugins
"
for suffix in init_suffix_list
  let file = "~/.vim/init-plug-" . suffix . ".vim"
  if FileExists(file)
    echom "Sourcing " . file
    call SourceVimScript(file)
  endif
endfor

call plug#end()
