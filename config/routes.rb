Rails.application.routes.draw do
  get 'memos/new'

  get 'memos/create'

  get 'memos/destroy'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'toppages/index'

  root to: "toppages#index"
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create] do
  member do
      get :drop
    end
  end
  
  resources :memos, only: [:new, :create, :destroy, :edit, :update] 
  
   get 'add', to: 'memos#new'
end
