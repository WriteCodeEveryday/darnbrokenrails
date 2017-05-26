class CreateSoftwares < ActiveRecord::Migration
  def change
    create_table :softwares do |t|
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
