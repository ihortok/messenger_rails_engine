# frozen_string_literal: true

module Messenger
  # Messenger model
  class User < ApplicationRecord
    self.table_name = 'users'

    devise :database_authenticatable, :registerable, :validatable
  end
end
