let s:V = chatwork#util#get_vital()
let s:BufferManager = s:V.import('Vim.BufferManager')

function! chatwork#buffer#initialize() "{{{
  call chatwork#variables#initalize()

  silent tabnew
  silent wincmd o

  call chatwork#buffer#messages#initialize()
  call chatwork#buffer#tasks#initialize()
  call chatwork#buffer#members#initialize()
  call chatwork#buffer#rooms#initialize()
endfunction"}}}

function! chatwork#buffer#get_base(name) "{{{
  let buffer = copy(s:Buffer)
  let buffer.name = a:name

  return buffer
endfunction"}}}

" s:Buffer"{{{
let s:Buffer = {
      \ 'BufferManager' : s:BufferManager,
      \ 'buffers' : [],
      \ '_common' : { 'rooms': { '16737582' : {} } },
      \ }
" [todo] - commonは消す。別の場所から初期化する

function! s:Buffer.new() "{{{
  call self.initialize()
endfunction"}}}

function! s:Buffer.setup_buffer() "{{{
  silent let self.buffer = self.layout()
  call add(self.buffers, self.buffer)
endfunction"}}}

function! s:Buffer.initialize() "{{{
  call self.setup_buffer()
  call self.setup_base()

  if has_key(self, 'setup')
    call self.setup()
  endif
  " [todo] - Move this function

  if has_key(self, 'render')
    call self.render()
  endif
endfunction"}}}

function! s:Buffer.setup_base() "{{{
  setlocal buftype=nofile noswapfile bufhidden=hide
  setlocal foldmethod=manual foldcolumn=0 nomodeline

  if has('conceal')
    setlocal conceallevel=2
    setlocal concealcursor=nc
  endif

  autocmd! * <buffer>
  autocmd BufEnter <buffer> silent call s:Buffer.on_enter()
  autocmd BufLeave <buffer> silent call s:Buffer.on_leave()
  autocmd CursorHold <buffer> silent call s:Buffer.polling()
  doau BufEnter <buffer>
endfunction"}}}

function! s:Buffer.do_hooks(type) "{{{
  " let buffer_name = bufname('')
endfunction"}}}

function! s:Buffer.on_enter() "{{{
  let b:updatetime_saved = &updatetime
  let &updatetime = g:chatwork#update_time

  call s:Buffer.do_hooks('on_enter')
endfunction"}}}

function! s:Buffer.on_leave() "{{{
  if exists('b:updatetime_saved')
    let &updatetime = b:updatetime_saved
  endif
  call s:Buffer.do_hooks('on_leave')
endfunction"}}}

function! s:Buffer.polling() "{{{
  silent! call feedkeys("g\<Esc>", 'n')
  call s:Buffer.do_hooks('polling')
endfunction"}}}
"}}}

function! chatwork#buffer#update_information(information)
endfunction
