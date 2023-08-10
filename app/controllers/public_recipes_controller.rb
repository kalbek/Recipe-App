# app/controllers/public_recipe_controller.rb
class PublicRecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @recipes = Recipe.where(public: true).order(id: :desc)
  end
end
