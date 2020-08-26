Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets do
    resources :articles
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  # resources :users, only: :show
  resources :users, only: [:show] do
    # resources :articles, only: :index
    # resources :articles
  end
end
