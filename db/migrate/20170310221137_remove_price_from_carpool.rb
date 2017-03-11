class RemovePriceFromCarpool < ActiveRecord::Migration
  def change
      remove_column :carpools, :total_price
  end
end
