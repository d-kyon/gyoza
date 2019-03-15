class CreateMonthlies < ActiveRecord::Migration[5.2]
  def change
    create_table :monthlies do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :year,null: false, default: 0
      t.integer :month,null: false, default: 0
      t.integer :sum_target,null: false, default: 0
      t.integer :target_monthly,null: false, default: 0
      t.integer :sum_cost,null: false, default: 0
      t.integer :sum_earning,null: false, default: 0
      t.integer :attendance_days,null: false, default: 0

      t.timestamps
    end
  end
end
