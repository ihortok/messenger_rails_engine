Messenger::Engine.routes.draw do
  devise_for :users, class_name: "Messenger::User"
end
