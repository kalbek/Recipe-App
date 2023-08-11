require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before :each do
    @user = User.create(name: 'Test', email: 'test3@gmail.com', password: 123_456, password_confirmation: 123_456)
    @recipe = Recipe.create(name: 'Jolof Rice', preparation_time: 125, cooking_time: 30,
                            description: 'A Jolof rice reccipe', public: false, user_id: @user.id)
    @food = Food.create(name: 'Jolof Rice', measurement_unit: 'Kg', price: 30, quantity: 28, user_id: @user.id)
  end

  context 'RecipeFood model validations' do
    it 'ensures quantity presence' do
      recipe_food = RecipeFood.new(recipe_id: @recipe.id, food_id: @food.id).save
      expect(recipe_food).to eq(false)
    end

    it 'ensures quantity numericality' do
      recipe_food = RecipeFood.new(recipe_id: @recipe.id, food_id: @food.id, quantity: 'a').save
      expect(recipe_food).to eq(false)
    end
  end
end
