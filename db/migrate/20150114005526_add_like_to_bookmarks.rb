class AddLikeToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :like_id, :integer
    add_index :bookmarks, :like_id
  end
end
