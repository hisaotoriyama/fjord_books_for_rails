class ChangeColumnsAddNotnullOnBooks < ActiveRecord::Migration[6.0]
  def change
    change_column :books, :title, :string, null: false, default: ""
    change_column :books, :author, :string, null: false, default: ""
  end
end
