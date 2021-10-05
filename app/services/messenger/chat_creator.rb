# frozen_string_literal: true

module Messenger
  # ChatCreator service
  class ChatCreator
    attr_reader :user_first, :user_second

    def initialize(user_first, user_second)
      @user_first = user_first
      @user_second = user_second
    end

    def call
      ActiveRecord::Base.transaction do
        @chat = Chat.create!

        ChatMember.create!(chat: @chat, user: user_first)
        ChatMember.create!(chat: @chat, user: user_second)
      end
    rescue StandardError => e
      OpenStruct.new({ success?: false, error: e })
    else
      OpenStruct.new({ success?: true, chat_id: @chat.id })
    end
  end
end
