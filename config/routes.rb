Rails.application.routes.draw do
  devise_for :users
  root "users#index"

  resources :users, only: [:show, :edit, :update] do
    resources :posts do
      resources :comments
    end
  end
end
