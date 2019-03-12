class AddAddressToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :address, :string, null: false, default: "不明"
    add_column :attendances, :longitude, :float,null: false, default: 0
    add_column :attendances, :latitude, :float,null: false, default: 0
  end
end
