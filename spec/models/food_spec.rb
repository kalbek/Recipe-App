require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { User.create!(name: 'Test User', email: 'food@mail.com', password: 'password') }
  let(:food) { Food.create!(name: 'Test Food', quantity: 2, user_id: user.id) }

  context 'validations' do
    it 'requires a name' do
      food.name = nil
      expect(food).to_not be_valid
    end

    it 'requires a quantity' do
      food.quantity = nil
      expect(food).to_not be_valid
    end
  end
end
