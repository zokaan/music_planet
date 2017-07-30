class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :song_name, null: false
      t.string :artist, null: false
      t.string :genre
      t.integer :favorites
      t.datetime :year_of_publishing
      t.datetime :duration

      t.timestamps
    end
  end
end
