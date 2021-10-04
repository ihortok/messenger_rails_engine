# frozen_string_literal: true

module Messenger
  # Messenger model
  class User < ApplicationRecord
    self.table_name = 'users'

    devise :database_authenticatable, :registerable, :validatable

    has_many :chat_members
    has_many :chats, through: :chat_members
  end
end
