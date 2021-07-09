Rails.application.routes.draw do
  devise_for :users
  root "posts#index"

  resources :users, only: [] do
    resources :posts do
      resources :comments
    end
  end
end
