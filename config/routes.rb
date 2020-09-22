Rails.application.routes.draw do
  root to: 'articles#index'
  resources :articles do
    resources :novels, only: [:show, :create, :destroy, :edit, :update]
    collection do
      get 'search'
    end
  end
  devise_for :users
  resources :users, only: :show do
    collection do
      get 'search'
    end
  end
  resources :tweets do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :home, only: [:index, :show]
end
