class AddColumnToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :purchaser, foreign_key: { to_table: :users }
  end
end
