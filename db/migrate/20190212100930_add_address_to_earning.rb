class AddAddressToEarning < ActiveRecord::Migration[5.2]
  def change
    add_column :earnings, :address, :string, null: false, default: ""
    add_column :earnings, :longitude, :float,null: false, default: 0
    add_column :earnings, :latitude, :float,null: false, default: 0
  end
end
