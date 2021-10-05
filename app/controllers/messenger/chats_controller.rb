# frozen_string_literal: true

require_dependency 'messenger/application_controller'

module Messenger
  # ChatsController
  class ChatsController < ApplicationController
    def index
      @chats = Chat.all_for(current_user)
      @users_without_chats = User.all_except(current_user).where.not(id: @chats.map { |chat| chat.users.first.id })
    end

    def create
      @chat = Messenger::Chat.new

      if @chat.save!
        @chat.chat_members.create(user_id: current_user.id)
        @chat.chat_members.create(user_id: params[:user_id])
      end
    end
  end
end
