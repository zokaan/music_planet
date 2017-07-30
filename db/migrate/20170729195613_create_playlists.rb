class CreatePlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists do |t|
      t.string :playlist_name, null: false

      t.timestamps
    end
  end
end
