class CreateNows < ActiveRecord::Migration[5.2]
  def change
    create_table :nows do |t|
      t.integer :one_id
      t.string :day

      t.timestamps
    end
  end
end
