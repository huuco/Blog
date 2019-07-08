Rails.application.routes.draw do
  devise_for :users,:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root "static_pages#home"

  resources :searchs, only: :index
  resources :users
  resources :categories
  resources :posts do
    resources :comments do
      member do
        get :reply
      end
    end
    resources :rates
    resources :likes
  end
  resources :comments do
    resources :comments
  end
  namespace :admin do
    root "comments#new"
    resources :posts
    resources :comments
  end
  get "*path", to: redirect("/")
end
