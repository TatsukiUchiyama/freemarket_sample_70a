class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.string  :name,                null:false
      t.text    :description,         null:false
      t.string  :condition,           null:false
      t.string  :category,            null:false
      t.string  :brand
      t.string  :shipping_payer,      null:false
      t.string  :shipping_from_area,  null:false
      t.string  :shipping_duration,   null:false
      t.integer :price,               null:false
      t.integer :user_id,             null:false, foreign_key: true
      t.references :user,            null:false, foreign_key: true

      t.timestamps
    end
  end
end