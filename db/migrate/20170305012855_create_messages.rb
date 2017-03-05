class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.datetime :sent_at
      t.string :username
      t.integer :carpool_id

      t.timestamps null: false
    end
      
      add_column :messages, :message_id, :integer
      add_index :messages, :message_id
  
  end
end
