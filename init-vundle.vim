"Setting up Vundle for the first time
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
endif
let &rtp=vundle_home . ',' . &rtp

call vundle#begin()
Plugin 'gmarik/vundle'
"Add your bundles here

"Plugin 'Valloric/YouCompleteMe'

"Load common plugins
call SourceVimScript("~/.vim/init-vundle-common.vim")

"Load language plugins
"
for lang in programming_languages 
  let file = "~/.vim/init-vundle-" . lang . ".vim"
  if FileExists(file)
    echom "Sourcing " . file
    call SourceVimScript(file)
  endif
endfor
call vundle#end()
