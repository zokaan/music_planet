class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.references :song, index: true, foreign_key: true
      t.references :playlist, index: true, foreign_key: true

      t.timestamps
    end
  end
end
