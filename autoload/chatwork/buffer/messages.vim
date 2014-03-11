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

function! s:buffer.render() "{{{
  let body = [{
        \ 'name' : '須澤 壮太',
        \ 'company' : '株式会社アントレプレナーファクトリー',
        \ 'body' : 'すいません、テスト近々行います！学習は会社でできていないので週一程度になってます！自宅で頑張ります！プッシュします！',
        \ 'date' : '10月24日 08:46',
        \ }, {
        \ 'name' : '石井 浩之',
        \ 'company' : '株式会社アントレプレナーファクトリー',
        \ 'body' : '前転送した、バイトに応募された方はどうなりましたか？進捗を教えてください。',
        \ 'date' : '10月24日 11:47'
        \ }, {
        \ 'name' : '須澤 壮太',
        \ 'company' : '株式会社アントレプレナーファクトリー',
        \ 'body' : '面談が嶋内さんとのスケジュールと毎回合わず、再々調整中です。電話でのコンタクトになっています。',
        \ 'date' : '10月25日 09:33',
        \ }
        \ ]
  call map(range(0, len(body) - 1), 's:buffer.append(v:val, body[v:val])')
endfunction"}}}

function! s:buffer.append(id, message) "{{{
  let body = map(split(a:message.body, '\n'), '" " . v:val')

  let header = printf("%s (%s)", a:message.name, a:message.date)
  call insert(body, header)
  " put body
  call append(line('$'), body)
endfunction"}}}
