class AddLocationToEarning < ActiveRecord::Migration[5.2]
  def change
    add_column :earnings, :location, :string,default: "", null: false
  end
end
