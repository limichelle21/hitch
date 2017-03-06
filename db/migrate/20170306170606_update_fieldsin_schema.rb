class UpdateFieldsinSchema < ActiveRecord::Migration
  def change
      remove_column :users, :ratings
      remove_column :rides, :payments
      remove_column :payments, :payment_id
      remove_column :disbursements, :disbursement_id
      remove_column :disbursements, :payment_id
      remove_column :messages, :message_id
      
      add_column :users, :payment_card_token, :string
      add_column :users, :bank_account_token, :string
      add_column :users, :card_type, :string
      add_column :users, :last_4, :string
      
      rename_column :rides, :ride_id, :user_id
      
      add_column :carpools, :rider_number, :integer
      add_column :carpools, :total_payment, :float
      
      
  end
end
