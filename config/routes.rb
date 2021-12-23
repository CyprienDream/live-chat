Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    resources :users, only: %i[show]
    get '/users/:id/chatrooms', to: 'users#chatrooms', as: :user_chatrooms
    # get '/logout',  to: 'sessions#destroy', as: :logout
  end

  root to: 'pages#home'

  resources :chatrooms, only: %i[show create] do
    resources :messages, only: %i[create]
  end
end
