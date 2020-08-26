Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets do
    resources :articles, only: [:new, :show, :create]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show] do
  end
  # resources :articles
end
