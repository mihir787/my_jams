class AddTagToSongs < ActiveRecord::Migration
  def change
    add_reference :songs, :tag, index: true, foreign_key: true
  end
end
