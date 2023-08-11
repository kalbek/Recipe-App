require 'test_helper'

class ShoppingListIndexViewTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = FactoryBot.create(:user, email: 'unique@example.com')
    sign_in @user

    @foods = FactoryBot.create_list(:food, 3)
    @user_foods = FactoryBot.create_list(:food, 2, user: @user)
  end

  test 'should show shopping list' do
    get shopping_list_path

    assert_response :success
    assert_select 'title', 'User Posts'

    assert_select '.recipe-name', text: 'Shopping List'

    assert_select 'th', text: 'Food'
    assert_select 'th', text: 'Quantity'
    assert_select 'th', text: 'Price'


  end
end
