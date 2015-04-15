"Setting up Vundle for the first time
let iCanHazVundle=1
let vundle_home = expand('~/.vim/bundle/Vundle.vim')
let vundle_readme=vundle_home . '/README.md'
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  echo "Installing path: " . vundle_home
  let mkdir_cmd = ":silent !mkdir -p " . vundle_home
  let clone_cmd = ":silent !git clone https://github.com/gmarik/Vundle.vim.git " . vundle_home

  execute mkdir_cmd
  execute clone_cmd
  let iCanHazVundle=0
endif
let &rtp=vundle_home . ',' . &rtp

call vundle#begin()
Plugin 'gmarik/vundle'
"Add your bundles here

Plugin 'tpope/vim-rails.git'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'Shougo/vimproc'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimshell'
Plugin 'scrooloose/nerdtree'

Plugin 'shawncplus/phpcomplete.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'wincent/command-t'
Plugin 'jiangmiao/auto-pairs'
Plugin 'majutsushi/tagbar'
"Plugin 'nurmine/Zenburn'
Plugin 'flazz/vim-colorschemes'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/Pydiction'
Plugin 'pangloss/vim-javascript'
Plugin 'moll/vim-node'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'jaredly/vim-debug'
Plugin 'msanders/snipmate.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tomasr/molokai'
Plugin 'Chiel92/vim-autoformat'
Plugin 'vim-php/vim-php-refactoring'
Plugin 'Valloric/MatchTagAlways'
Plugin 'megaannum/vimside'
Plugin 'ervandew/supertab'
Plugin 'kana/vim-fakeclip'
Plugin 'andre-luiz-dos-santos/autocomp'
Plugin 'tfnico/vim-gradle'
Plugin 'ervandew/screen'
Plugin 'carlobaldassi/ConqueTerm'


Plugin 'laurilehmijoki/haskellmode-vim'
Plugin 'dag/vim2hs'
Plugin 'eagletmt/ghcmod-vim'

Plugin 'indenthtml.vim'
Plugin 'mattn/emmet-vim'

"...All your other bundles...
Plugin 'sjl/badwolf'
Plugin 'fatih/vim-go'

Plugin 'vim-scripts/c.vim'
"Plugin 'Valloric/YouCompleteMe'

call vundle#end()

if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PluginInstall
endif
