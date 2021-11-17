# frozen_string_literal: true

require_dependency 'messenger/application_controller'

module Messenger
  # ChatsController
  class ChatsController < ApplicationController
    before_action :set_user, only: :create

    def index
      @pagy, @chats = pagy(Chat.all_for(current_user), items: 10)
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
