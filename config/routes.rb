Messenger::Engine.routes.draw do
  devise_for :users, path: 'users', class_name: 'Messenger::User', module: :devise

  resources :chats, only: :index
end
