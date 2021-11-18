# frozen_string_literal: true

module Messenger
  # User model
  class User < ApplicationRecord
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    settings do
      mappings dynamic: false do
        indexes :id, type: :integer
        indexes :email, type: :keyword
        indexes :first_name, type: :keyword
        indexes :last_name, type: :keyword
        indexes :nickname, type: :keyword
      end
    end

    devise :database_authenticatable, :registerable, :validatable

    has_and_belongs_to_many :chats, join_table: 'messenger_chats_users'

    scope :all_except, ->(user) { where.not(id: user) }
  end
end
