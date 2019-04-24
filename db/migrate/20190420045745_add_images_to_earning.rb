class AddImagesToEarning < ActiveRecord::Migration[5.2]
  def change
    add_column :earnings, :expenses_image, :string
    add_column :earnings, :ordering_image, :string
    add_column :earnings, :others_image, :string
  end
end
