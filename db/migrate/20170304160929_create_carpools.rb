class CreateCarpools < ActiveRecord::Migration
  def change
    create_table :carpools do |t|
      t.float :total_price
      t.integer :user_id
      t.integer :ride_id
      t.timestamps null: false
    end
      
      add_index :carpools, :id, unique: true
      add_index :carpools, :user_id
      add_index :carpools, :ride_id
  end
end
