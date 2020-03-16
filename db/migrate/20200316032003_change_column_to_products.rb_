class ChangeColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :shipping_payer, :string
    remove_column :products, :shipping_from_area, :string
    remove_column :products, :shipping_duration, :string
    remove_column :products, :condition, :string

    add_column :products, :shipping_payer_id,      :integer, null: false
    add_column :products, :shipping_from_area_id,  :integer, null: false
    add_column :products, :shipping_duration_id,   :integer, null: false
    add_column :products, :condition_id,           :integer, null: false
  end
end
