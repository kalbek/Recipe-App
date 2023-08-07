class Recipe < ApplicationRecord
  belongs_to :user_id
  has_many :recipe_foods, dependent: :destroy
end
