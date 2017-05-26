class AddVerificationEndpointAndLicenseKey < ActiveRecord::Migration
  def change
    add_column :softwares, :verification_endpoint, :string
    add_column :softwares, :license_key, :string
  end
end
