require 'test_helper'

class FoodsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = FactoryBot.create(:user)
    @food = FactoryBot.create(:food, user: @user)
    sign_in @user
  end

  test 'should get index' do
    get foods_path
    assert_response :success
    assert_not_nil assigns(:user)
  end

  test 'should show food' do
    get user_food_path(user_id: @user, id: @food)
    assert_response :success
    assert_not_nil assigns(:user)
  end

  test 'should get new' do
    get new_food_path
    assert_response :success
    assert_not_nil assigns(:food)
    assert_not_nil assigns(:current_user)
  end

  test 'should create food' do
    assert_difference('Food.count') do
      post foods_path, params: { food: { name: 'New Food', measurement_unit: 'grams', quantity: 100, price: 5.0 } }
    end

    assert_redirected_to user_foods_path(@user, assigns(:food))
  end

  test 'should destroy food' do
    assert_difference('Food.count', -1) do
      delete food_path(@food)
    end

    assert_redirected_to user_foods_path
  end
end
