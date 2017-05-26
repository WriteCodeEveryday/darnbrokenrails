class AddExpirationDateToSoftware < ActiveRecord::Migration
  def change
    add_column :softwares, :expiration_date, :datetime
  end
end
