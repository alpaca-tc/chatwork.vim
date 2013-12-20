function! chatwork#api#v1#rooms#messages(...) "{{{
  let params = chatwork#api#v1#parse_params(a:000)
  let url = printf('/rooms/%s/messages', params.room_id)

  if has_key(params, 'message_id')
    let url = printf('%s/%s', url, params.message_id)
    return chatwork#api#v1#connect(params.method, url, params)
  else
    return chatwork#api#v1#connect(params.method, url, params)
  endif
endfunction"}}}

function! chatwork#api#v1#rooms#members(...) "{{{
  let params = chatwork#api#v1#parse_params(a:000)
  let url = printf('/rooms/%s/members', params.room_id)

  return chatwork#api#v1#connect(params.method, url, params)
endfunction"}}}

function! chatwork#api#v1#rooms#tasks(...) "{{{
  let params = chatwork#api#v1#parse_params(a:000)
  let url = printf('/rooms/%s/tasks', params.room_id)

  if has_key(params, 'task_id')
    let url = printf('%s/%s', url, params.task_id)
    return chatwork#api#v1#connect(params.method, url, params)
  else
    return chatwork#api#v1#connect(params.method, url, params)
  endif
endfunction"}}}

function! chatwork#api#v1#rooms#files(...) "{{{
  let params = chatwork#api#v1#parse_params(a:000)
  let url = printf('/rooms/%s/files', params.room_id)

  if has_key(params, 'file_id')
    let url = printf('%s/%s', url, params.file_id)
    return chatwork#api#v1#connect(params.method, url, params)
  else
    return chatwork#api#v1#connect(params.method, url, params)
  endif
endfunction"}}}
