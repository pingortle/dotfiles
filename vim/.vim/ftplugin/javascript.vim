function! LoadMainNodeModule(fname)
  if a:fname =~ "^\\."
    if a:fname =~ "^\\.\\."
      return substitute(a:fname, "\\.\\.", expand("%:p:h:h"), "")
    else
      return substitute(a:fname, "\\.", expand("%:p:h"), "")
    endif
  endif

  let nodeModules = "./node_modules/"
  let packageJsonPath = nodeModules . a:fname . "/package.json"

  if filereadable(packageJsonPath)
    return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
  else
    return nodeModules . a:fname
  endif
endfunction

set includeexpr=LoadMainNodeModule(v:fname)
