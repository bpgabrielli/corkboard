class AddColumnsToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :thumbnail, :text
    add_column :bookmarks, :description, :text
  end
end
