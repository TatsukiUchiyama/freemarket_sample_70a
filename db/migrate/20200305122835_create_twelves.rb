class CreateTwelves < ActiveRecord::Migration[5.2]
  def change
    create_table :twelves do |t|
      t.integer :season_id
      t.string :month

      t.timestamps
    end
  end
end
