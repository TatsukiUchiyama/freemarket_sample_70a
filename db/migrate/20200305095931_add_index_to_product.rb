class AddIndexToProduct < ActiveRecord::Migration[5.2]
  def change
    add_index :product, :email, unique: true
  end
end
