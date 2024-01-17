class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :about, :string
    add_column :users, :is_admin, :boolean, default: false
  end
end
