# frozen_string_literal: true

module Messenger
  # ChatMember model
  class ChatMember < ApplicationRecord
    belongs_to :chat
    belongs_to :user
  end
end
