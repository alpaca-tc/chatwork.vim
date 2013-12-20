function! chatwork#buffer#messages#initialize() "{{{
  call s:buffer.new()
endfunction"}}}

let s:buffer = chatwork#buffer#get_base('chatwork_messages')

function! s:buffer.layout() "{{{
  edit `=self.name`
endfunction"}}}

function! s:buffer.setup() "{{{
endfunction"}}}
