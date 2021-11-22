class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string  :name,             null: false
      t.integer :price,            null: false
      t.text    :description,      null: false
      t.integer :condition_id,     null: false,unique: true
      t.integer :shipping_cost_id, null: false,unique: true
      t.integer :shipping_days_id, null: false,unique: true
      t.integer :prefecture_id,    null: false,unique: true
      t.integer :category_id,      null: false,unique: true
      t.references :user,          null: false, foreign_key: true

      t.timestamps
    end
  end
end
