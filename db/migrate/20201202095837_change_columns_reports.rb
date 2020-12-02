class ChangeColumnsReports < ActiveRecord::Migration[6.0]
  def up
    change_column :reports, :user_id, :integer, default: 0, null: false
    add_index :reports, :user_id
    add_foreign_key :reports, :users
  end

  def down
    change_column :reports, :user_id, :integer, default: 0, index: true, null: false, foreign_key: true
  end
end
