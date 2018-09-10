class AddFieldsToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :data, :string
  end
end
