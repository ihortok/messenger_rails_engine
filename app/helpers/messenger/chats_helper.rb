module Messenger
  module ChatsHelper
    def chart_for(user_1, user_2)
      user_1.chats.joins(:users).where(users: { id: user_2 }).first
    end

    def chat_link_content(user)
      "#{user.first_name} #{user.last_name} - #{user.nickname} - <i>(#{user.email})</i>".html_safe
    end
  end
end
