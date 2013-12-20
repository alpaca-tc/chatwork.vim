function! chatwork#buffer#tasks#initialize() "{{{
  call s:buffer.new()
endfunction"}}}

let s:buffer = chatwork#buffer#get_base('chatwork_tasks')

function! s:buffer.layout() "{{{
  let buffer = self.BufferManager.open(self.name, 'rightbelow vsplit')
  execute g:chatwork#buffer#rightbar_width 'wincmd |'

  return buffer
endfunction"}}}

function! s:buffer.setup() "{{{
endfunction"}}}

function! s:buffer.render() "{{{
  let tasks = chatwork#api#v1#rooms#tasks({ 'room_id' : keys(self._common.rooms)[0], 'method' : 'get' }).body
  call map(range(0, len(tasks) - 1), 's:buffer.append(v:val, tasks[v:val])')
endfunction"}}}

function! s:buffer.append(id, task) "{{{
  call append(line('$'), a:task.body)
endfunction"}}}
