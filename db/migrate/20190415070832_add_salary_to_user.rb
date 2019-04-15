class AddSalaryToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :salary, :integer, index: true, foreign_key: true
  end
end
