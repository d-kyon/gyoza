class AddAddressToEarning < ActiveRecord::Migration[5.2]
  def change
    add_column :earnings, :address, :string, null: false
    add_column :earnings, :longitude, :float,null: false
    add_column :earnings, :latitude, :float,null: false
  end
end
