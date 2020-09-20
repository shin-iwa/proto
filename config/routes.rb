Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
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
  resources :articles do
    resources :novels, only: [:show, :create, :destroy, :edit, :update]
    resources :impressions, only: [:show, :create, :destroy, :edit, :update, :index]
    collection do
      get 'search'
    end
  end
  resources :home, only: [:index, :show]
end
