class AddImageToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :image, :string
  end
end
