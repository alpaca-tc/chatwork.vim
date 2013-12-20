function! chatwork#buffer#tasks#initialize() "{{{
  call s:buffer.new()
endfunction"}}}

let s:buffer = chatwork#buffer#get_base('chatwork_tasks')

function! s:buffer.layout() "{{{
  let buffer = self.BufferManager.open(self.name, 'leftabove vsplit')
  execute g:chatwork#buffer#rightbar_width 'wincmd |'

  return buffer
endfunction"}}}

function! s:buffer.setup() "{{{
endfunction"}}}
