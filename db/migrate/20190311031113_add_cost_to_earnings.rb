class AddCostToEarnings < ActiveRecord::Migration[5.2]
  def change
    add_column :earnings, :cost, :integer,null: false, default: 0
    add_column :earnings, :target, :integer,null: false, default: 0
  end
end
