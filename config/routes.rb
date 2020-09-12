Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  resources :users, only: [:show] 
  resources :tweets do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :articles do
    resources :novels, only: [:show, :create, :destroy, :edit, :update]
    collection do
      get 'search'
    end
  end
end
