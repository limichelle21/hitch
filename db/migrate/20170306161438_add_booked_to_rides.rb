class AddBookedToRides < ActiveRecord::Migration
  def change
      add_column :rides, :booked, :boolean
  end
end
