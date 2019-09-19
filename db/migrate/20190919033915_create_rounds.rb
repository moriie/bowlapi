class CreateRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :rounds do |t|
      t.integer :first_roll
      t.integer :second_roll
      t.bool :strike
      t.bool :spare
      t.integer :total
      t.integer :player_id
      t.integer :game_id

      t.timestamps
    end
  end
end
