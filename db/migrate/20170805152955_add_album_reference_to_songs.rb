class AddAlbumReferenceToSongs < ActiveRecord::Migration[5.1]
  def change
    add_reference :songs, :album, foreign_key: true, index: true
  end
end
