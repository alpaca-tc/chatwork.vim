function! chatwork#variables#initalize() "{{{
  if exists('s:is_initialized')
    return
  endif
  let s:is_initialized = 1

  " [todo] - デフォルト値を修正する
  let g:chatwork#token = get(g:, 'chatwork#token', '535068121542058fad749bd1d84c0ad6')
  let g:chatwork#buffer#rooms_height = get(g:, 'chatwork#buffer#rooms_height', 10)
  let g:chatwork#buffer#leftbar_width = get(g:, 'chatwork#buffer#leftbar_width', 25)
  let g:chatwork#buffer#rightbar_width = get(g:, 'chatwork#buffer#rightbar_width', 25)
endfunction"}}}
