Rails.application.routes.draw do
  devise_for :users
  get '/home', to: 'pages#home'
end
