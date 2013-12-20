function! chatwork#buffer#messages#initialize() "{{{
  call s:buffer.new()
endfunction"}}}

let s:buffer = chatwork#buffer#get_base('chatwork_messages')

function! s:buffer.layout() "{{{
  silent only
  return self.BufferManager.open(self.name, 'edit')
endfunction"}}}

function! s:buffer.setup() "{{{
endfunction"}}}
