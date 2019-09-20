class AddDefaultValueToTotal < ActiveRecord::Migration[6.0]
  def change
    change_column_default :rounds, :total, 0
  end
end
