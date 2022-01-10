Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    resources :users, only: %i[show]
    get '/users/:id/new_chat', to: 'users#new_chat', as: :new_chat
  end

  root to: 'pages#home'

  resources :chatrooms, only: %i[show create] do
    resources :messages, only: :create
  end
end
