require 'test_helper'

class FoodsIndexViewTest < ActionView::TestCase
  test 'should render a list of foods' do
    @user = FactoryBot.create(:user) # Assume you have a fixture or factory for users
    @foods = [
      FactoryBot.create(:food, user: @user),
      FactoryBot.create(:food, user: @user)
    ]

    render template: 'foods/index'

    assert_select 'table tr', count: @foods.count + 1 # +1 for the header row
    @foods.each do |food|
      assert_select 'td', text: food.name
    end
  end
end
