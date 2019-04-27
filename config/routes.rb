Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'toppages/index'

  root to: "toppages#index"
  

  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create]
end
