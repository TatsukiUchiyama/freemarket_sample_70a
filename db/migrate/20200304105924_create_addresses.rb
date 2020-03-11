class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :prefecture_id
      t.string :municipalities,     null: false
      t.string :family_name_kanji,  null: false
      t.string :first_name_kanji,   null: false
      t.string :family_name_kana,   null: false
      t.string :first_name_kana,    null: false
      t.string :postal_code,        null: false
      t.string :block_number,       null: false
      t.string :building_name
      t.string :room_number
      t.string :phone_number
      t.references :user,           null: false, foreign_key: true

      t.timestamps
    end
  end
end
