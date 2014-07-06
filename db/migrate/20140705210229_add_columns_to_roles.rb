class AddColumnsToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :wedding_id, :integer
    add_column :roles, :user_id, :integer
  end
end
