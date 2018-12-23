Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"
  get "/contact", to: "static_pages#contact"
  resources :users
  resources :categories
  resources :posts do
    resources :comments
    resources :rates
  end
end
