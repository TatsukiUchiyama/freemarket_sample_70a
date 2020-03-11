class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|

      t.references :product,       null: false, foreign_key: true
      t.integer :status
      t.integer :card_id,          null: false, foreign_key: true
      t.references :user,          null: false, foreign_key: true
      # t.references :card,          null: false, foreign_key: true
      # テーブル作成後変更予定です

      t.timestamps
    end
  end
end
