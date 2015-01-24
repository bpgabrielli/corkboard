class AddTopicNameToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :topic_name, :string
  end
end
