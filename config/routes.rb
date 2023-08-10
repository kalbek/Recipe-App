Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  resources :foods, only: [:new, :create, :destroy]
  resources :recipes, only: [:new, :create, :destroy]
  resources :food_recipes, only: [:new, :create]

  devise_for :users

  # Defines the root path route ("/")
  root to: 'foods#index'

  # get 'users', to: 'users#index', as: :users

  # User profile route
  # get 'users/:id', to: 'users#show', as: :user

  # User foods route
  get 'foods', to: 'foods#index', as: :user_foods

  # User recipes route
  get 'recipes', to: 'recipes#index', as: :user_recipes

  # Specific user recipe route
  get 'recipes/:id', to: 'recipes#show', as: :user_recipe

  # Public recipes route
  get 'public_recipes', to: 'public_recipes#index', as: :public_recipes
  
  # Public recipes route
  get 'general_shopping_list', to: 'shopping_list#index', as: :shopping_list

  # Specific user food route
  get 'users/:user_id/foods/:id', to: 'foods#show', as: :user_food

  patch 'recipes/:id', to: 'recipes#update'


  # API routes
  namespace :api, defaults: { format: :json } do
    resources :users, only: [] do
      resources :foods, only: :index
    end
    resources :foods, only: [] do
      resources :recipes, only: :index
      resources :recipes, only: :create
    end
    resources :users do
      resources :foods, only: [] do
        resources :recipes, only: :index
      end
    end
    resources :foods, only: [] do
      resources :recipes, only: :create
    end
  end

end
