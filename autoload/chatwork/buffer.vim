function! chatwork#buffer#initialize() "{{{
  tabnew
  wincmd o

  call s:MessagesBuffer.initialize()
  call s:MembersBuffer.initialize()
  call s:RoomsBuffer.initialize()
endfunction"}}}
