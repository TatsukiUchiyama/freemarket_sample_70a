class ChangeUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :birthday_year, :integer
    remove_column :users, :birthday_month, :integer
    remove_column :users, :birthday_day, :integer

    add_column :users, :year_id, :integer, null: false
    add_column :users, :month_id, :integer, null: false
    add_column :users, :day_id, :integer, null: false
  end
end
