require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.create!(name: 'Test User', email: 'recipe@mail.com', password: 'password') }
  let(:recipe) { Recipe.create!(name: 'Test Recipe', user_id: user.id) }

  context 'validations' do
    it 'requires a name' do
      recipe.name = nil
      expect(recipe).to_not be_valid
    end
  end
end
