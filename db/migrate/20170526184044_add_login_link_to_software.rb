class AddLoginLinkToSoftware < ActiveRecord::Migration
  def change
    add_column :softwares, :login_link, :string
  end
end
