class AddDefaultValuesToRecipes < ActiveRecord::Migration[7.0]
  def change
    def change
      change_column :recipes, :cooking_time, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
      change_column :recipes, :preparation_time, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
