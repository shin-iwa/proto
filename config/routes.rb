Rails.application.routes.draw do
  devise_for :users
  # root to: 'tweets#index'
  root to: 'articles#index'
  resources :tweets do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show] do
  end
  resources :articles do
    resources :novels, only: [:show, :create, :destroy, :edit, :update]
  end
end
