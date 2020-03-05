class CreateAges < ActiveRecord::Migration[5.2]
  def change
    create_table :ages do |t|
      t.integer :ad_id
      t.string :year

      t.timestamps
    end
  end
end
