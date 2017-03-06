class CreateDisbursements < ActiveRecord::Migration
  def change
    create_table :disbursements do |t|
      t.integer :disbursement_id
      t.integer :payment_id
      t.integer :stripe_disbursement_id
      t.integer :user_id
      t.datetime :disbursed_at

      t.timestamps null: false
    end
    add_index :disbursements, :disbursement_id
  end
end
