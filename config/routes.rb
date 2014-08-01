PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts do
    member do
      resources :comments, only: [:new, :create]
    end
  end
  resources :users
  resources :categories
end
