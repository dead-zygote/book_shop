Newbs::Application.routes.draw do
  devise_for :users

  resources :books, only: [:index, :show]
  resources :cart_items, only: [:index, :create, :destroy]
  get '/cart' => 'cart_items#index'
  delete '/cart' => 'cart_items#destroy_all'
  
  resources :publishers do
    resources :books, only: [:index]
  end
  
  
  resources :authors do
    resources :books, only: [:index]
  end
  
  resources :categories do
    resources :books, only: [:index]
  end
  
  resources :addresses
  resources :orders
  resources :payments, only: [:new]
  
  
  namespace :admin do
    resources :books
    
    resources :orders do
      resources :shipments
    end
    
    resources :customers
    resources :publishers, only: [:index, :create, :edit, :update]
    resources :authors, only: [:index, :edit, :update, :destroy]
    resources :categories, only: [:index, :edit, :update, :destroy]
    
    root to: 'orders#index'
  end
  
  root to: 'books#index'
end
