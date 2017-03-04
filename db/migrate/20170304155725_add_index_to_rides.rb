class AddIndexToRides < ActiveRecord::Migration
  def change
      add_column :rides, :ride_id, :integer
      add_index :rides, :ride_id
  end
end
