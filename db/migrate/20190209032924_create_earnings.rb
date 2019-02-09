class CreateEarnings < ActiveRecord::Migration[5.2]
  def change
    create_table :earnings do |t|
      t.integer :user_id
      t.date :date
      t.integer :revenue

      t.timestamps
    end
  end
end
