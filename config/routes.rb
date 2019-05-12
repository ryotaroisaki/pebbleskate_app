Rails.application.routes.draw do
  get 'tricks/show'

  get 'tricks/new'

  get 'tricks/create'

  get 'tricks/destroy'

  get 'favorites/create'

  get 'favorites/destroy'

  get 'relationships/new'

  get 'relationships/create'

  get 'relationships/destroy'

  get 'genres/index'

  get 'genres/show'

  get 'genres/new'

  get 'genres/create'

  get 'genres/destroy'

  get 'videos/show'

  get 'videos/new'

  get 'videos/create'

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
      get :library
    end
  end
  
  resources :memos, only: [:index, :new, :create, :destroy, :edit, :update] 
  
  
  get 'option', to: 'genres#option'
  
  resources :genres, only: [:index, :show, :new, :create, :destroy] do
  member do
      get :select
      post :trickcreate
    end
  end
  
  resources :tricks, only: [:show, :new, :create, :destroy]
  
  resources :videos, only: [:index, :show, :new, :create, :destroy]
  
  resources :relationships, only: [:new, :create, :destroy]
  
  resources :favorites, only: [:create, :destroy]
  
   get 'add', to: 'memos#new'
end
