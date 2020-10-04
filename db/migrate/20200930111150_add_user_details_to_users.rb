# frozen_string_literal: true

class AddUserDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :zip, :integer
    add_column :users, :address, :string
    add_column :users, :profile, :text
  end
end
