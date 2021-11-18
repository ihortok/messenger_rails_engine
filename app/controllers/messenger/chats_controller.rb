# frozen_string_literal: true

require_dependency 'messenger/application_controller'

module Messenger
  # ChatsController
  class ChatsController < ApplicationController
    before_action :set_user, only: :create

    def index
      if params[:search].present?
        @users = FindUsers.new(users).call(permitted_params)
        @pagy = Pagy.new_from_elasticsearch_rails @users, items: 10
      else
        @pagy, @users = pagy(FindUsers.new(users).call, items: 10)
      end
    end

    def create
      result = ChatCreator.new(current_user, @user).call

      if result.success?
        redirect_to chat_messages_path(result.chat_id)
      else
        redirect_to chats_path, alert: result.e
      end
    end

    private

    def permitted_params
      params.permit(:search)
    end

    def users
      @users ||= User.all_except(current_user)
    end

    def set_user
      @user = User.find(params[:user_id])
    end
  end
end
