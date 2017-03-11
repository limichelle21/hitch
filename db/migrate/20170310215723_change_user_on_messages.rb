class ChangeUserOnMessages < ActiveRecord::Migration
  def change
      remove_column :messages, :username
      add_column :messages, :user_id, :integer
  end
end
