Rails.application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index, :edit, :update, :destroy] do
  	resources :relationships, only: [:create, :destroy]
  	get :follows, on: :member
  	get :followers, on: :member
  end
  get 'users/:id/likes' =>'users#likes', as: 'user_likes'

  resources :posts do
  	resources :likes, only: [:create, :destroy]
  	resources :comments, only: [:create, :destroy]
  end
  get 'posts/:id/ranks' =>'posts#rank', as: 'post_rank'
end

