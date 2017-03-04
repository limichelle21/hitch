class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.date :ride_date
      t.string :departure_location
      t.string :arrival_location
      t.float :seat_price
      t.float :payments
      t.integer :total_seats
      t.integer :available_seats
      t.integer :reserved_seats
      t.text :notes
      t.float :total_ride_amount
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
