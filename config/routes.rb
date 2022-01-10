Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    resources :users, only: %i[show]
  end

  root to: 'pages#home'

  resources :chatrooms, only: %i[show create] do
    resources :messages, only: :create
  end
end
