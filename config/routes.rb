Rails.application.routes.draw do
  devise_for :users,:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root "static_pages#home"
  get "/contact", to: "static_pages#contact"

  resources :searchs, only: :index
  resources :categories
  resources :users
  resources :categories
  resources :posts do
    resources :comments
    resources :rates
    resources :likes
  end

  namespace :admin do
    root "posts#index"
    resources :posts
  end
  get "*path", to: redirect("/")
end
