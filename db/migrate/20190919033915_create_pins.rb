class CreatePins < ActiveRecord::Migration[6.0]
  def change
    create_table :rounds do |t|
      t.string :standing

      t.timestamps
    end
  end
end
