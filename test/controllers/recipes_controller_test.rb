require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = FactoryBot.create(:user)
    sign_in @user
    @recipe = FactoryBot.create(:recipe, user: @user)
  end

  test 'should get index' do
    get recipes_path
    assert_response :success
    assert_not_nil assigns(:user)
    assert_not_nil assigns(:recipes)
  end

  test 'should show recipe' do
    get user_recipe_path(user_id: @user, id: @recipe)
    assert_response :success
    assert_not_nil assigns(:user)
    assert_not_nil assigns(:recipe)
    assert_not_nil assigns(:food)
  end

  test 'should get new' do
    get new_recipe_path
    assert_response :success
    assert_not_nil assigns(:recipe)
    assert_not_nil assigns(:current_user)
  end

  test 'should create recipe' do
    assert_difference('Recipe.count') do
      post recipes_path, params: { recipe: { name: 'New Recipe' } }
    end

    assert_redirected_to user_recipes_path(@user, assigns(:food))
  end

  test 'should update recipe' do
    patch recipe_path(@recipe), params: { recipe: { name: 'Updated Recipe' } }
    assert_redirected_to user_recipe_path(id: @recipe)
  end

  test 'should destroy recipe' do
    assert_difference('Recipe.count', -1) do
      delete recipe_path(@recipe)
    end

    assert_redirected_to user_recipes_path
  end
end
