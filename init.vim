let programming_languages=["python", "html"]

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


call SourceVimScript("~/.vim/init-common.vim")
call SourceVimScript("~/.vim/init-mapping.vim")

for lang in programming_languages 
  let file = "~/.vim/init-" . lang . ".vim"
  if FileExists(file)
    echom "Sourcing " . file
    call SourceVimScript(file)
  endif
endfor

