# -*- coding:utf-8 -*-

Plugin.create(:open_user) do

  querybox = Gtk::Entry.new()
  searchbtn = Gtk::Button.new('開く')
  userlist = Gtk::UserList.new

  tab :open_user, 'User' do
    shrink
    nativewidget Gtk::HBox.new(false, 0).pack_start(querybox).closeup(searchbtn)
    expand
    nativewidget userlist
  end

  searchbtn.signal_connect('clicked'){ |elm|
    user = User.findbyidname(querybox.text)
    if user
      Plugin.call(:show_profile, Service.primary, user)
      userlist.add_user(Users.new([user]))
    end
  }

end
