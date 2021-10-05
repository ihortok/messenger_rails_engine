# frozen_string_literal: true

require_dependency 'messenger/application_controller'

module Messenger
  # ChatsController
  class ChatsController < ApplicationController
    before_action :set_user, only: :create

    def index
      @chats = Chat.all_for(current_user)
      @users_without_chats = User.all_except(current_user).where.not(id: @chats.map { |chat| chat.users.first.id })
    end

    def create
      result = ChatCreator.new(current_user, @user).call

      if result.success?
        redirect_to chat_messages_path(result.chat_id)
      else
        redirect_to chats_path, alert: result.e
      end
    end

    private

    def set_user
      @user = User.find(params[:user_id])
    end
  end
end
