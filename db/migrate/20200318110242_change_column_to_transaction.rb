class ChangeColumnToTransaction < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :transactions, :users
    remove_index :transactions, :user_id
    remove_reference :transactions, :user
  end
end
