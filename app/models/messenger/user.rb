# frozen_string_literal: true

module Messenger
  # User model
  class User < ApplicationRecord
    devise :database_authenticatable, :registerable, :validatable

    has_and_belongs_to_many :chats, join_table: 'messenger_chats_users'

    scope :all_except, ->(user) { where.not(id: user) }
  end
end
