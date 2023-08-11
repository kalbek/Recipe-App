require 'test_helper'

class RecipesIndexViewTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = FactoryBot.create(:user)
    sign_in @user

    @recipe1 = FactoryBot.create(:recipe, user: @user, name: 'Recipe 1', description: 'Description 1')
    @recipe2 = FactoryBot.create(:recipe, user: @user, name: 'Recipe 2', description: 'Description 2')
  end

  test 'should render a list of recipes' do
    get user_recipes_path

    assert_response :success
    assert_select 'title', 'User Posts'

    assert_select '.recipe-name', text: 'Recipe 1'
    assert_select '.recipe-name', text: 'Recipe 2'

    assert_select '.desc-scroll', text: 'Description 1'
    assert_select '.desc-scroll', text: 'Description 2'

    assert_select 'a.plain', text: 'Add New'
  end
end
