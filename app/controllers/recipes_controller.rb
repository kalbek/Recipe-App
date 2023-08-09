# app/controllers/posts_controller.rb
class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
  end

  def new
    @recipe = current_user.recipes.build
    @current_user = current_user
  end
  
  def public_recipes
    @recipes = Recipe.where(public: true)
  end

  def public_recipes_show
    @recipe = Recipe.find(params[:id])
  end
end
