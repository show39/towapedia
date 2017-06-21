Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :towas, only: [:create] do
    resources :meanings, only: [:create]
  end
  root 'static_pages#home'
end
