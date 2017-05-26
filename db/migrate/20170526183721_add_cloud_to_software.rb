class AddCloudToSoftware < ActiveRecord::Migration
  def change
    add_column :softwares, :cloud, :boolean, default: false
    # XXX The next two migrations should be merged into this one. Rails can 
    # optimize adding columns as long as it's in the same table. The larger the table, 
    # the more useful this is.
    # Source: https://rails-bestpractices.com/posts/2011/10/30/optimize-db-migration/
  end
end
