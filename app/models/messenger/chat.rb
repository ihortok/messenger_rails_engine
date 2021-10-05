# frozen_string_literal: true

module Messenger
  # Chat model
  class Chat < ApplicationRecord
    has_many :chat_members
    has_many :users, through: :chat_members
    has_many :messages

    scope :all_for, ->(user) { user.chats.includes(:users).where.not(users: { id: user.id }) }
  end
end
