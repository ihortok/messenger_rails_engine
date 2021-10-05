# frozen_string_literal: true

require_dependency 'messenger/application_controller'

module Messenger
  # MessagesController
  class MessagesController < ApplicationController
    def create
      Messenger::Message.create(message_params)
    end

    private

    def message_params
      params.require(:message).permit(:content, :chat_id, :user_id)
    end
  end
end
