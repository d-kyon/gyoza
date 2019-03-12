class CreateEarnings < ActiveRecord::Migration[5.2]
  def change
    create_table :earnings do |t|
      t.references :user, index: true, foreign_key: true
      t.date :date
      t.integer :revenue, null: false, default: 0

      t.timestamps
    end
  end
end
