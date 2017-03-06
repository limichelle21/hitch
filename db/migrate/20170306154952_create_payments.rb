class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :payment_id
      t.integer :carpool_id
      t.integer :user_id
      t.datetime :paid_at
      t.integer :stripe_id
      t.integer :disbursement_id
      t.float :payment_amount

      t.timestamps null: false
    end
    add_index :payments, :payment_id
  end
end
