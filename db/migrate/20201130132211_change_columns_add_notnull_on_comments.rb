class ChangeColumnsAddNotnullOnComments < ActiveRecord::Migration[6.0]
  def change
    change_column :comments, :body, :text, null: false, default: ""
  end
end
