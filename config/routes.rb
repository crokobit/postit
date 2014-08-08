PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  namespace :admin do
    resources :categories, only: [:new, :create]
  end

  resources :posts do
    resources :comments, only: [:new, :create] do
      member do
        get 'vote_up', to: 'comments#vote_up'
        get 'vote_down', to: 'comments#vote_down'
      end
    end
    member do
      get 'vote_up', to: 'posts#vote_up'
      get 'vote_down', to: 'posts#vote_down'
    end
  end
  resources :users
  resources :categories, only: [:show]

  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  get '/register', to: 'users#new'
end
