# app/controllers/posts_controller.rb
class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
  end

  def new
    @recipe_food = current_user.recipe_foods.build
    @current_user = current_user
  end
end
