Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :users, only: [:show] do
    resources :tweets do
      resources :comments, only: :create
      collection do
        get 'search'
        resources :articles, only: [:new, :create]
      end
    end
  # resources :users, only: :show
  resources :users, only: [:show] do
    # resources :articles, only: :index
    resources :articles, only: [:new, :create]
  end
end
