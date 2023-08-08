Rails.application.routes.draw do

  # resources :foods, only: [:new, :create, :destroy]
  # resources :recipes, only: [:new, :create, :destroy]
  # resources :food_recipes, only: [:new, :create]

  # devise_for :users, controllers: { sessions: 'users/sessions' }

  # Defines the root path route ("/")
  root to: 'users#index'

  get 'users', to: 'users#index', as: :users

  # User profile route
  get 'users/:id', to: 'users#show', as: :user

  # User foods route
  get 'users/:user_id/foods', to: 'foods#index', as: :user_foods

  # Specific user food route
  get 'users/:user_id/foods/:id', to: 'foods#show', as: :user_food

end
