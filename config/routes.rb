Messenger::Engine.routes.draw do
  devise_for :users, path: 'users', class_name: 'Messenger::User', module: :devise

  root to: 'chats#index'
  resources :chats, only: [:index, :show, :create]
  resources :messages, only: :create
end
