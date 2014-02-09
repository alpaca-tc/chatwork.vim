function! chatwork#variables#initalize() "{{{
  if exists('s:is_initialized')
    return
  endif
  let s:is_initialized = 1

  " [todo] - デフォルト値を修正する
  let g:chatwork#buffer#rooms_height = get(g:, 'chatwork#buffer#rooms_height', 10)
  let g:chatwork#buffer#leftbar_width = get(g:, 'chatwork#buffer#leftbar_width', 20)
  let g:chatwork#buffer#rightbar_width = get(g:, 'chatwork#buffer#rightbar_width', 20)
  let g:chatwork#update_time = get(g:, 'chatwork#update_time', 500)
endfunction"}}}
