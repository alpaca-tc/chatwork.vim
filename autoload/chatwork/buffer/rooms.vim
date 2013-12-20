function! chatwork#buffer#rooms#initialize() "{{{
  call s:buffer.new()
endfunction"}}}

let s:buffer = chatwork#buffer#get_base('chatwork_rooms')

function! s:buffer.layout() "{{{
  execute 'leftabove split' self.name
  execute g:chatwork#buffer#rooms_height 'wincmd _'
  execute g:chatwork#buffer#rooms_width 'wincmd |'
endfunction"}}}

function! s:buffer.setup() "{{{
endfunction"}}}
