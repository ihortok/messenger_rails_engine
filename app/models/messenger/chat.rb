# frozen_string_literal: true

module Messenger
  # Chat model
  class Chat < ApplicationRecord
    has_many :chat_members
    has_many :users, through: :chat_members
  end
end
