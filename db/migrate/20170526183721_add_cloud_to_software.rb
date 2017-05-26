class AddCloudToSoftware < ActiveRecord::Migration
  def change
    add_column :softwares, :cloud, :boolean, default: false
  end
end
