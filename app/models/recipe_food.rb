class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :name, presence: true
end
