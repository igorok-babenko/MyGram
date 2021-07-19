Rails.application.routes.draw do
  devise_for :users
  root "users#index"

  resources :likes, only: [:create, :destroy]
  resources :follows, only: [:create, :destroy]
  resources :feed_posts, only: [:index]

  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :followers, only: :index
    resources :followings, only: :index
    resources :posts do
      resources :comments
    end
  end
end
