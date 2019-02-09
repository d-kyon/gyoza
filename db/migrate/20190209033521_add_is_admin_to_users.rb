class AddIsAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_admin, :boolean, default: false, null: false
    add_column :users, :username, :string, null: false, default: ""
  end
end
