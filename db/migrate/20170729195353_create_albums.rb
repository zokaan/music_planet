class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :album_name, null: false
      t.string :publisher
      t.string :made_in
      t.string :description

      t.timestamps
    end
  end
end
