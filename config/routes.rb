Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :users
  resources :roles
  resources :countries
  resources :profiles
  resources :comments, only: [:index, :show, :new, :edit, :create, :update, :destroy]  # Top-level comments

  root "posts#index"
end
