class ChangeColumnsAddFkOnReports < ActiveRecord::Migration[6.0]
  def change
    change_column :reports, :user_id, :integer, default: 0, index: true, null: false, foreign_key: true 
  end
end
