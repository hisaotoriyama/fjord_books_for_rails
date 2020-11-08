class RenameFollowNameToRelationships < ActiveRecord::Migration[6.0]
  def change
    rename_column :relationships, :follower_id, :following_id
    rename_column :relationships, :followed_id, :follower_id
  end
end
