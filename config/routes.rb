Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  resources :foods, only: [:new, :create, :destroy]
  resources :recipes, only: [:new, :create, :destroy]
  resources :food_recipes, only: [:new, :create]

  devise_for :users

  # Defines the root path route ("/")
  root to: 'users#index'

  get 'users', to: 'users#index', as: :users

  # User profile route
  get 'users/:id', to: 'users#show', as: :user

  # User foods route
  get 'foods', to: 'foods#index', as: :user_foods

  # Specific user food route
  get 'users/:user_id/foods/:id', to: 'foods#show', as: :user_food

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
