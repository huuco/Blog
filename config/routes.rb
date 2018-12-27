Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"
  get "/contact", to: "static_pages#contact"

  resources :searchs, only: :index
  resources :categories
  resources :users
  resources :categories
  resources :posts do
    resources :comments
    resources :rates
  end

  namespace :admin do
    root "posts#index"
    resources :posts
  end
end
