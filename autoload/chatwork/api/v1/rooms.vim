function! chatwork#api#v1#rooms#members(...) "{{{
  let method = has_key(params, 'method') ? params.method : 'get'
  let url = '/rooms'

  if has_key(params, 'room_id')
    let url .= '/' . params.room_id
  endif
endfunction"}}}
