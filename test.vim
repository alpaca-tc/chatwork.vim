try
  " echo chatwork#api#connect('get', '/my/status')
  let room_id = '16737582'
  let message_id = '207690767'
  let body = 'test'
  let my_id = '738867'

  " echo chatwork#api#v1#rooms#messages({ 'room_id' : room_id, 'message_id' : message_id })
  " echo chatwork#api#v1#rooms()
  " echo chatwork#api#v1#rooms#members({ 'room_id' : room_id }).body
  " echo chatwork#api#v1#rooms#messages({ 'room_id' : room_id })
  " echo chatwork#api#v1#rooms#tasks({ 'room_id' : room_id })
  " echo chatwork#api#v1#rooms#tasks({ 'room_id' : room_id, 'method' : 'post', 'account_id' : my_id, 'body': 'test_todo', 'to_ids': my_id })
  " echo chatwork#api#v1#rooms#files({ 'room_id' : room_id })

  " Buffer
  call chatwork#buffer#initialize()
  " call chatwork#buffer#get_base('name')
  " silent call g:b.open('_test', { 'opener' : 'topleft vsplit' })
catch /.*/
  echomsg 'Test::' . v:errmsg
endtry

" sleep 3
" qall
