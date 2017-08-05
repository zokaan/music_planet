class AddUserReferenceToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_reference :albums, :user, foreign_key: true, index: true
  end
end
