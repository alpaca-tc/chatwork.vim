function! chatwork#util#get_vital() "{{{
  if !exists('s:V')
    let s:V = vital#of('chatwork.vim')
  endif

  return s:V
endfunction"}}}
