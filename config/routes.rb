Rails.application.routes.draw do


  devise_for :users
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index, :edit, :update, :destroy] do
  	resources :relationships, only: [:create, :destroy]
  	get :follows, on: :member
  	get :followers, on: :member
  end

  resources :posts do
  	resources :photos, only: [:create]
  	resources :likes, only: [:create, :destroy]
  	resources :comments, only: [:create, :destroy]
  end
end

