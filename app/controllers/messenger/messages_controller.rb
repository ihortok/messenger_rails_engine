# frozen_string_literal: true

require_dependency 'messenger/application_controller'

module Messenger
  # MessagesController
  class MessagesController < ApplicationController
    before_action :set_chat
    before_action :set_message, only: :index

    def index
      @pagy, @messages = pagy(@chat.messages.order(created_at: :desc), items: 10)
    end

    def create
      @message = Messenger::Message.new(message_params)

      if @message.save!
        redirect_to chat_messages_path(@chat)
      else
        render :index
      end
    end

    private

    def set_chat
      @chat = Chat.find(params[:chat_id])
    end

    def set_message
      @message = Message.new
    end

    def message_params
      params.require(:message).permit(:content, :chat_id, :user_id)
    end
  end
end
