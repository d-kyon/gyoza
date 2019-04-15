class CreateCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :costs do |t|
      t.references :user, index: true, foreign_key: true
      t.references :earning, index: true, foreign_key: true
      t.integer :travel_cost,null: false, default: 0
      t.integer :accommodation,null: false, default: 0
      t.integer :buying_price,null: false, default: 0
      t.integer :for_tasting,null: false, default: 0
      t.integer :fixtures,null: false, default: 0
      t.integer :others,null: false, default: 0
      t.string :others_content,null: false, default: ""

      t.timestamps
    end
  end
end
