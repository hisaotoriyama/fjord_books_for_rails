# frozen_string_literal: true

class ChangeColumnsAddForeignKeyOnReports < ActiveRecord::Migration[6.0]
  def change
    change_column :reports, :user_id, :integer, null: false, default: 0, index: true, foerign_key: true
  end
end
