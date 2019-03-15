class AddMonthlyToEarnings < ActiveRecord::Migration[5.2]
  def change
    add_reference :earnings, :monthly, index: true, foreign_key: true
  end
end
