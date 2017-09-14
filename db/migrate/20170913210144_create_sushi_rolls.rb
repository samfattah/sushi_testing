class CreateSushiRolls < ActiveRecord::Migration[5.1]
  def change
    create_table :sushi_rolls do |t|
      t.string :name
      t.string :fish_type
      t.boolean :spicy
      t.integer :price

      t.timestamps
    end
  end
end
