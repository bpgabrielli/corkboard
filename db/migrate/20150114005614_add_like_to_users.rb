class AddLikeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :like_id, :integer
    add_index :users, :like_id
  end
end
