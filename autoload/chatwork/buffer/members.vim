function! chatwork#buffer#members#initialize() "{{{
  call s:buffer.new()
endfunction"}}}

let s:buffer = chatwork#buffer#get_base('chatwork_members')

function! s:buffer.layout() "{{{
  let buffer = self.BufferManager.open(self.name, 'topleft vsplit')
  execute g:chatwork#buffer#leftbar_width 'wincmd |'

  return buffer
endfunction"}}}

function! s:buffer.setup() "{{{
endfunction"}}}
