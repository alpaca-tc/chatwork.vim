scriptencoding utf-8

function! chatwork#buffer#members#initialize() "{{{
  call s:buffer.new()
endfunction"}}}

let s:buffer = chatwork#buffer#get_base('chatwork_members')

function! s:buffer.layout() "{{{
  let buffer = self.BufferManager.open(self.name, 'topleft vsplit')
  execute g:chatwork#buffer#leftbar_width 'wincmd |'

  return buffer
endfunction"}}}

function! s:buffer.render() "{{{
  " [todo] - room_idは、動的に変わる
  " let members = chatwork#api#v1#rooms#members({ 'room_id' : keys(self._common.rooms)[0] }).body
  let members = [{'department': '', 'role': 'admin', 'avatar_image_url': 'https://tky-chat-work-appdata.s3.amazonaws.com/avatar/263/263489.rsz.jpg', 'name': '石井 浩之', 'organization_name': '株式会社アントレプレナーファクトリー', 'account_id': 738867, 'chatwork_id': '', 'organization_id': 106330}, {'department': '', 'role': 'member', 'avatar_image_url': 'https://tky-chat-work-appdata.s3.amazonaws.com/avatar/13/13799.jpg', 'name': '嶋内 秀之', 'organization_name': '株式会社アントレプレナーファクトリー', 'account_id': 740160, 'chatwork_id': '', 'organization_id': 106330}]

  call map(range(0, len(members) - 1), 's:buffer.append(v:val, members[v:val])')
  0 delete
endfunction"}}}

function! s:buffer.setup() "{{{
  let self._members = {}
endfunction"}}}

function! s:buffer.append(id, member) "{{{
  " [todo] - 行数によって、メンバーが一意に決まるようにする
  " let self._members[current_line] = a:member
  call append(line('$'), a:member.name)
endfunction"}}}
