class AddS3PathToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :s3_path, :string
  end
end
