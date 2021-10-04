# frozen_string_literal: true

module Messenger
  # User model
  class User < ApplicationRecord
    devise :database_authenticatable, :registerable, :validatable

    has_many :chat_members
    has_many :chats, through: :chat_members
  end
end
