class AddTimeToRides < ActiveRecord::Migration
  def change
      add_column :rides, :departure_time, :time
  end
end
