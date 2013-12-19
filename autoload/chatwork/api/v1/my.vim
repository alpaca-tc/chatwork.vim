function! chatwork#api#v1#my#status(...) "{{{
  return chatwork#api#connect('get', '/my/status')
endfunction"}}}

function! chatwork#api#v1#my#tasks(...) "{{{
  return chatwork#api#connect('get', '/my/tasks')
endfunction"}}}
