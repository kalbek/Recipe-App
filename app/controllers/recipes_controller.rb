# app/controllers/posts_controller.rb
class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end
  
  def show
    @user = current_user
    @recipe = @user.recipes.includes(:user).find(params[:id])
  end

  def new
    @recipe = current_user.recipes.build
    @current_user = current_user
  end

  def create
    @recipe = current_user.recipes

    if @recipe.save
      redirect_to user_recipes_path(@recipe.user, @food), notice: 'Post created successfully.'
    else
      flash.now[:alert] = @recipe.errors.full_messages.join(', ')
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params) # use the strong parameters
      redirect_to user_recipe_path(id: @recipe.id)
    else
      render :edit
    end
  end  

  def destroy
    @recipe = Recipe.find(params[:id])
    # authorize! :destroy, @food # This line checks if the user is authorized to delete the post
    @recipe.destroy
    redirect_to user_recipes_path, notice: 'recipe was successfully deleted.'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :cooking_time, :preparation_time, :description, :public) # permit the public attribute
  end
end
