let s:V = chatwork#util#get_vital()
let s:BufferManager = s:V.import("Vim.BufferManager")

function! chatwork#buffer#initialize() "{{{
  call chatwork#variables#initalize()

  tabnew
  wincmd o

  call chatwork#buffer#messages#initialize()
  call chatwork#buffer#members#initialize()
  call chatwork#buffer#rooms#initialize()
endfunction"}}}

function! chatwork#buffer#get_base(name) "{{{
  let buffer = copy(s:Buffer)
  let buffer.name = a:name

  return buffer
endfunction"}}}

" s:Buffer"{{{
let s:Buffer = {}

function! s:Buffer.new() "{{{
  call self.initialize()
endfunction"}}}

function! s:Buffer.initialize() "{{{
  let self.buffer = s:BufferManager.new(self.name)
  if has_key(self, 'layout')
    call self.layout()
  endif

  if has_key(self, 'setup')
    call self.setup()
  endif
endfunction"}}}
"}}}

