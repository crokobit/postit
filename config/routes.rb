PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts do
    resources :comments, only: [:new, :create]
  end
  resources :users
  resources :categories

  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
end
