class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rating_value
      t.text :rating_comment
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
