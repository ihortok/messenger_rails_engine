# frozen_string_literal: true

require_dependency 'messenger/application_controller'

module Messenger
  # MessagesController
  class MessagesController < ApplicationController
    before_action :set_chat
    before_action :set_message, only: :index

    def index
      if params[:search].present?
        @messages = FindMessages.new(@chat.messages).call(permitted_params)
        @pagy = Pagy.new_from_elasticsearch_rails @messages, items: 10
      else
        @pagy, @messages = pagy(FindMessages.new(@chat.messages).call, items: 10)
      end
    end

    def create
      @message = Message.new(message_params)

      if @message.save!
        redirect_to chat_messages_path(@chat)
      else
        render :index
      end
    end

    private

    def permitted_params
      params.permit(:chat_id, :search)
    end

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
