# app/controllers/posts_controller.rb
class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
  end

  def new
    @food = current_user.foods.build
    @current_user = current_user
  end

end
