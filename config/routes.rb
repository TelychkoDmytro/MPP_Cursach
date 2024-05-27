Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :admin do
    resources :posts
  end
  resources :users, only: [:show, :edit, :update]
  resources :hobies, only: [:index, :show] do
    resources :posts, only: [:show, :new, :create, :edit, :update] do
      resources :likes
      resources :comments, only: [:create, :destroy]
      resources :reports, only: [:new, :create]
    end
  end
  root to: "hobies#index"
end
