class AddPurchaserIdToSoftware < ActiveRecord::Migration
  def change
    add_column :softwares, :purchaser_id, :integer
  end
end
