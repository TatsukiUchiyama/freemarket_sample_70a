class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def change
    change_column :images, :image ,:string, null: true
  end
end
