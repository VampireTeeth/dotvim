Plugin 'L9'
Plugin 'scrooloose/nerdtree'
"Plugin 'wincent/command-t'
"Plugin 'jiangmiao/auto-pairs'
Plugin 'majutsushi/tagbar'
Plugin 'flazz/vim-colorschemes'
Plugin 'tomtom/tcomment_vim'
Plugin 'FuzzyFinder'
Plugin 'Shougo/vimproc'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimshell'
Plugin 'kien/ctrlp.vim'
Plugin 'tomasr/molokai'
"Plugin 'Valloric/MatchTagAlways'
Plugin 'ervandew/supertab'
Plugin 'msanders/snipmate.vim'
Plugin 'Zenburn'
Plugin 'gre/play2vim'
Plugin 'othree/html5.vim'
Plugin 'gtags.vim'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'itchyny/lightline.vim'

"Need to install fzf command
if executable("fzf")
    Plugin 'junegunn/fzf'
    Plugin 'junegunn/fzf.vim'
endif


"Need to install erlang and iex command
if executable("erl") && executable("iex")
    Plugin 'elixir-lang/vim-elixir'
    Plugin 'slashmili/alchemist.vim'
endif
