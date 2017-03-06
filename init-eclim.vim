
if $ECLIM_VIM
  let eclim_vim = $ECLIM_VIM
else
  let eclim_vim = expand('~/.vim/eclim')
endif

let &rtp=eclim_vim . ',' . &rtp

if !exists('g:EclimDisabled')
  let g:EclimDisabled = 1
endif

execute ":so ~/.vim/plugin/eclim.vim"
