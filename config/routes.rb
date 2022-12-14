Rails.application.routes.draw do
  devise_for :users
  root to: 'pics#index'
  resources :pics do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
