class AddFieldsToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :content_type, :string
    add_column :songs, :headers, :string
    add_column :songs, :original_filename, :string
    add_column :songs, :tempfile, :string
  end
end
