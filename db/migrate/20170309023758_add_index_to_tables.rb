class AddIndexToTables < ActiveRecord::Migration
  def change
      add_index :messages, :carpool_id
      add_index :payments, :user_id
      add_index :payments, :carpool_id
      add_index :ratings, :user_id
      add_index :disbursements, :user_id
      
  end
end
