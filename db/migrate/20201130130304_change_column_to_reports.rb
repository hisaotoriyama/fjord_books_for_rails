class ChangeColumnToReports < ActiveRecord::Migration[6.0]
  def change
    change_column :reports, :title, :string, null: false, default: ""
    change_column :reports, :body, :text, null: false, default: ""
    change_column :reports, :user_id, :integer, null: false, default: 0, index: true   
  end
end
