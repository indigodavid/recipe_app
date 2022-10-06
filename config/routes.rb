Rails.application.routes.draw do
  
  devise_for :users
  root to: "users#index"
  resources :users
  resources :foods
  resources :recipes do
    resources :recipe_foods
    get '/add_food/', to: 'recipe_foods#add_food'
    get '/shopping_list', to: 'recipes#shopping_list'
  end
  get '/public_recipes', to: 'recipes#public_recipes'
  get '/general_shopping_list', to: 'foods#general_shopping_list'
end
