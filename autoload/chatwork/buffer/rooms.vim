function! chatwork#buffer#rooms#initialize() "{{{
  call s:buffer.new()
endfunction"}}}

let s:buffer = chatwork#buffer#get_base('chatwork_rooms')

function! s:buffer.layout() "{{{
  let buffer = self.BufferManager.open(self.name, 'leftabove split')
  execute g:chatwork#buffer#rooms_height 'wincmd _'
  execute g:chatwork#buffer#leftbar_width 'wincmd |'

  return buffer
endfunction"}}}

function! s:buffer.setup() "{{{
endfunction"}}}
