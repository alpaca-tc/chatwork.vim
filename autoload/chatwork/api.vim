let s:api_version = 'v1'

function! chatwork#api#connect(method, path, ...) " {{{
  return chatwork#api#{s:api_version}#connect(a:method, a:path, a:000)
endfunction"}}}
