# frozen_string_literal: true

module Messenger
  # Message model
  class Message < ApplicationRecord
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    settings do
      mappings dynamic: false do
        indexes :id, type: :integer
        indexes :content, type: :text
      end
    end

    belongs_to :chat
    belongs_to :user
  end
end
