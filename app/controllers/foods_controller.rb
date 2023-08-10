# app/controllers/posts_controller.rb
class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def show
    @user = User.find(params[:user_id])
  end

  def new
    @food = current_user.foods.build
    @current_user = current_user
  end

  def create
    @food = current_user.foods.build(food_params)

    if @food.save
      redirect_to user_foods_path(@food.user, @food), notice: 'Post created successfully.'
    else
      flash.now[:alert] = @food.errors.full_messages.join(', ')
    end
  end

  def destroy
    @food = Food.find(params[:id])
    authorize! :destroy, @food
    @food.destroy
    redirect_to user_foods_path, notice: 'Food was successfully deleted.'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :quantity, :price)
  end
end
