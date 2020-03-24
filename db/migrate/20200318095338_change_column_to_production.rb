class ChangeColumnToProduction < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :products, :users
    remove_index :products, :user_id
    remove_reference :products, :user
  end
end
