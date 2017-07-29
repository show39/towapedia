Rails.application.routes.draw do
  devise_for :users
  get 'search' => 'search#search'
  get 'users/search' => 'search#search'
  get 'towas/search' => 'search#search'

  resources :users, only: [:show] do
    get 'page/:page', :action => :show, :on => :collection
  end

  resources :towas, only: [:create, :show] do
    resources :meanings, only: [:create]
  end

  resources :meanings, except: [:index, :create, :new, :edit, :show, :update, :destroy] do
    resources :lights, only: [:create]
  end

  resources :static_pages, only: [:home] do
    get 'page/:page', :action => :home, :on => :collection
  end

  root 'static_pages#home'
  get  '/about' => 'static_pages#about'
  get  '/dashboard' => 'static_pages#dashboard'
end
