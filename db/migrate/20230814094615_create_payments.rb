class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :author, foreign_key: { to_table: :users }
      t.references :transaction, foreign_key: { to_table: :expenses }
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
