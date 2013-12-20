function! chatwork#buffer#members#initialize() "{{{
  call s:buffer.new()
endfunction"}}}

let s:buffer = chatwork#buffer#get_base('chatwork_members')

function! s:buffer.layout() "{{{
  execute 'topleft vsplit' self.name
  execute g:chatwork#buffer#leftbar_width 'wincmd |'
endfunction"}}}

function! s:buffer.setup() "{{{
endfunction"}}}
