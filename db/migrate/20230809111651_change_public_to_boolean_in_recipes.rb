class ChangePublicToBooleanInRecipes < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :public, 'boolean USING CAST(public AS boolean)'

  end
end
