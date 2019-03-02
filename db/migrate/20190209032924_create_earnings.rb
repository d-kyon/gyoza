class CreateEarnings < ActiveRecord::Migration[5.2]
  def change
    create_table :earnings do |t|
      t.integer :user_id
      t.date :date
      t.integer :revenue, null: false, default: 0

      t.timestamps
    end
  end
end
