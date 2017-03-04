class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :phone_number, :string
    add_column :users, :ratings, :integer
    add_column :users, :average_rating, :integer
    add_column :users, :verified, :boolean
  end
end
