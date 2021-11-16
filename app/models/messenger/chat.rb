# frozen_string_literal: true

module Messenger
  # Chat model
  class Chat < ApplicationRecord
    has_many :messages
    has_and_belongs_to_many :users

    scope :all_for, ->(user) { user.chats.includes(:users).where.not(users: { id: user.id }) }
  end
end
