function! ResolveModule(fname)
  return trim(system("node -p 'require.resolve(\"" . a:fname . "\")'"))
endfunction

function! LoadMainNodeModule(fname)
  return ResolveModule(a:fname)
endfunction

set includeexpr=LoadMainNodeModule(v:fname)
