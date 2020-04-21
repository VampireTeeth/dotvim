" vim-plug
Plug 'fatih/vim-go' "Amazing combination of features.
Plug 'godoctor/godoctor.vim' "Some refactoring tools
if !has('nvim')
 Plug 'maralla/completor.vim' " or whichever you use
endif
if has('nvim')
 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 Plug 'zchee/deoplete-go', {'build': {'unix': 'make'}}
 Plug 'jodosha/vim-godebug' " Debugger integration via delve
 Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
endif
