class AddLyricsToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :lyrics, :string
  end
end
