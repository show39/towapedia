Rails.application.routes.draw do
  devise_for :users
  get 'search' => 'search#search'
  get 'users/search' => 'search#search'
  get 'towas/search' => 'search#search'
  resources :users, only: [:show]
  resources :towas, only: [:create, :show] do
    resources :meanings, only: [:create]
  end
  root 'static_pages#home'
end
