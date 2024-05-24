Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :hobies, only: [:index, :show] do
    resources :posts, only: [:show, :new, :create, :edit, :update] do
      resources :likes
    end
  end
  root to: "hobies#index"
end
