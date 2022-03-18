Rails.application.routes.draw do

  # Documments controller.
  post 'add_file', to: 'documents#create'

  # Connections controller.
  get 'add_user', to: 'connections#create'
  get 'remove_user', to: 'connections#destroy'

  # Projects controller.
  resources :projects

  # Profiles controller.
  resources :profiles

  # Users controller.
  devise_for :users

  # Root path.
  root 'pages#home'

end
