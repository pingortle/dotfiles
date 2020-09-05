function! test#ruby#dhh#test_file(file) abort
  return test#ruby#minitest#test_file(a:file) && fnamemodify(GitDir(),':h:t') ==# 'rails'
endfunction

function! test#ruby#dhh#build_position(type, position) abort
  return test#ruby#minitest#build_position(a:type, a:position)
endfunction

function! test#ruby#dhh#build_args(args) abort
  for option in ['--name', '--seed']
    let idx = index(a:args, option)
    if idx != -1
      let value = remove(a:args, idx + 1)
      let a:args[idx] = option.'='.shellescape(value, 1)
    endif
  endfor

  return ['-w', '-I'.split(a:args[0], '/')[0].'/test'] + a:args
endfunction

function! test#ruby#dhh#executable() abort
  return 'bundle exec ruby -w -I'.'railties/'.'test'
endfunction
