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
  resources :articles , only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :novels, only: [:index, :new, :create, :show, :edit]
  end
end
