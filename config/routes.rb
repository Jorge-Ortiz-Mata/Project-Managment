Rails.application.routes.draw do

  get 'add_user', to: 'connections#create'
  get 'remove_user', to: 'connections#destroy'

  resources :projects
  post 'add_images', to: 'projects#images'
  resources :profiles
  devise_for :users
  root 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
