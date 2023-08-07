class User < ApplicationRecord
  has_many :recipes, :foods, dependent: :destroy
end
