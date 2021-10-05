# frozen_string_literal: true

Messenger::Engine.routes.draw do
  devise_for :users, path: 'users', class_name: 'Messenger::User', module: :devise

  root to: 'chats#index'
  resources :chats, only: %i[index create] do
    resources :messages, only: %i[index create]
  end
end
