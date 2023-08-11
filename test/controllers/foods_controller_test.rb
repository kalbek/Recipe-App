require 'test_helper'

class FoodsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one) # Assuming you have a user fixture or factory
    sign_in @user
    @food = foods(:one) # Assuming you have a food fixture or factory
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:user)
  end

  test 'should show food' do
    get :show, params: { user_id: @user, id: @food }
    assert_response :success
    assert_not_nil assigns(:user)
  end

  test 'should get new' do
    get :new
    assert_response :success
    assert_not_nil assigns(:food)
    assert_not_nil assigns(:current_user)
  end

  test 'should create food' do
    assert_difference('Food.count') do
      post :create, params: { food: { name: 'New Food', quantity: 5 }, user_id: @user }
    end

    assert_redirected_to user_foods_path(@user, assigns(:food))
  end

  test 'should destroy food' do
    assert_difference('Food.count', -1) do
      delete :destroy, params: { id: @food }
    end

    assert_redirected_to user_foods_path
  end
end
