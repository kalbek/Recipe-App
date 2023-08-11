require 'test_helper'

class RecipesShowViewTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = FactoryBot.create(:user)
    sign_in @user

    @recipe = FactoryBot.create(:recipe, user: @user, name: 'Recipe Name', preparation_time: Time.now, cooking_time: Time.now, public: true)
    @food = FactoryBot.create(:food, user: @user)
  end

  test 'should show recipe' do
    get user_recipe_path(id: @recipe.id, user_id: @user.id)

    assert_response :success
    assert_select 'title', 'Show Recipe'
    assert_select '.recipe-name', text: 'Recipe Name'
    assert_select '.public-checkbox[checked]', count: 1

    assert_select 'th', text: 'Food'
    assert_select 'th', text: 'Quantity'
    assert_select 'th', text: 'Value'

    assert_select 'a.plain', text: 'Generate shoping list'
    assert_select 'a.plain', text: 'Add ingredient'
  end
end
