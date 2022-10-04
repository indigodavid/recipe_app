Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :users
  resources :foods
  resources :recipes do
    resources :recipe_foods
  end
end
