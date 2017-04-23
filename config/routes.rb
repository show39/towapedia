Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  resources :towas, only: [:create] do
    resources :meanings, only: [:create]
  end
end
