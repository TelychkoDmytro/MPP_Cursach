Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  root to: "home#index"
end
