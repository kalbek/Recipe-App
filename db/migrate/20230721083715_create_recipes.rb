class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.string :name
      t.datetime :cooking_time
      t.datetime :preparation_time
      t.text :description
      t.text :public
    end
  end
end
