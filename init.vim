let init_suffix_list=split($VIM_INIT_SUFFIX_LIST, ":")
let g:first_time_run=0

fu! SourceVimScript(file)
  execute ":so " . expand(a:file)
endfu

fu! FileExists(file)
  return !empty(glob(expand(a:file)))
endfu
"required!
filetype off 

call SourceVimScript("~/.vim/init-vundle.vim")

filetype plugin indent on

fu! LoadSettings(init_suffix_list)
  call SourceVimScript("~/.vim/init-common.vim")
  call SourceVimScript("~/.vim/init-mapping.vim")

  for lang in a:init_suffix_list
    let file = "~/.vim/init-" . lang . ".vim"
    if FileExists(file)
      echom "Sourcing " . file
      call SourceVimScript(file)
    endif
  endfor
endfu

if g:first_time_run
  echom "Please execute :PluginInstall to install plugins before loading the settings"
else
  call LoadSettings(init_suffix_list)
endif

if has("gui_running")
    set guioptions=icpM
    if has('win32') || has('win64')
        set guifont=Consolas:h11:cANSI
        if (v:version == 704 && has("patch393")) || v:version > 704
            set renderoptions=type:directx,level:0.75,gamma:1.25,contrast:0.25,geom:1,renmode:5,taamode:1
        endif
    endif
endif

