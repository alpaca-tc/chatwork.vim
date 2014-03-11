let s:V = chatwork#util#get_vital()
let s:HTTP = s:V.import('Web.HTTP')
let s:JSON = s:V.import('Web.JSON')

let s:base_endpoint = 'https://api.chatwork.com/v1'

" API Connector {{{
function! chatwork#api#v1#connect(method, path, ...) "{{{
  call chatwork#variables#initalize()
  let method = toupper(a:method)
  let path = a:path
  let raw = 0
  let params = {}

  for v in chatwork#util#flatten(a:000)
    if type(v) == type(0)
      let raw = v
    elseif type(v) == type({})
      call extend(params, v)
    elseif type(v) == type('')
      let path .= '/' . v
    endif

    unlet v
  endfor

  try
    let url = printf('%s%s', s:base_endpoint, path)
    if method == 'GET'
      let res = s:HTTP.get(url, params, s:get_header())
    elseif method == 'POST'
      let header = s:get_header()
      let res = s:HTTP.post(url, params, header, method)
    endif

    if empty(res.content)
      let content = {}
    else
      let content = raw ?
            \ chatwork#util#iconv(res.content, 'utf-8', &encoding) :
            \ s:JSON.decode(res.content)
    endif

    let body = {
          \ 'status' : res.status,
          \ 'body' : content
          \ }
  catch
    let body = { 'status' : res.status, 'body' : '', 'error_message' : v:errmsg }
  endtry

  return body
endfunction"}}}

function! s:get_header(...) " {{{
  if !exists('s:header')
    let s:header = {
          \ 'X-ChatWorkToken': get(g:, 'chatwork#token', ''),
          \ }
  endif

  let header = copy(s:header)
  if len(a:000) > 0 && type(a:1) == type({})
    call extend(header, a:1)
  endif

  return header
endfunction"}}}
"}}}

" API Wrapper {{{
function! chatwork#api#v1#contacts(...) " {{{
  return chatwork#api#v1#connect('get', '/contacts')
endfunction"}}}

function! chatwork#api#v1#me(...) " {{{
  return chatwork#api#v1#connect('get', '/me')
endfunction"}}}

function! chatwork#api#v1#rooms(...) " {{{
  let params = chatwork#api#v1#parse_params(a:000)

  if has_key(params, 'room_id')
    let url = printf('/rooms/%s', params.room_id)
  else
    let url = '/rooms'
  endif

  " [todo] - Create Object
  " http://developer.chatwork.com/ja/endpoint_rooms.html#GET-rooms
  return chatwork#api#v1#connect(params.method, url, params)
endfunction"}}}

function! chatwork#api#v1#parse_params(params) " {{{
  let params = {
        \ 'method' : 'get',
        \ }

  for v in a:params
    if type(v) == type({})
      call extend(params, v)
    endif
    unlet! v
  endfor

  return params
endfunction"}}}
"}}}
