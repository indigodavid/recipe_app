Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :users
  resources :foods, only: %i[:index :new :create :destroy] 
  resources :recipes, only: %i[:index :new :create :destroy] do
    resources :recipe_foods
  end
end
