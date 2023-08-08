class Food < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :recipe_food, foreign_key: :food_id, dependent: :destroy

  validates :name, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
