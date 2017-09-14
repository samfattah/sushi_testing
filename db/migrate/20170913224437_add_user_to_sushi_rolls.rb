class AddUserToSushiRolls < ActiveRecord::Migration[5.1]
  def change
    add_reference :sushi_rolls, :user, foreign_key: true
  end
end
