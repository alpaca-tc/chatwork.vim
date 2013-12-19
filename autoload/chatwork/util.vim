function! chatwork#util#get_vital() "{{{
  if !exists('s:V')
    let s:V = vital#of('chatwork.vim')
  endif

  return s:V
endfunction"}}}

function! chatwork#util#flatten(list) "{{{
  let list = []
  for i in a:list
    if type(i) == type([])
      let list += chatwork#util#flatten(i)
    else
      call add(list, i)
    endif
    unlet! i
  endfor

  return list
endfunction"}}}

function! chatwork#util#iconv(expr, from, to) "{{{
  if a:from ==# a:to || a:from == '' || a:to == ''
    return a:expr
  endif
  let result = iconv(a:expr, a:from, a:to)

  return result != '' ? result : a:expr
endfunction"}}}
