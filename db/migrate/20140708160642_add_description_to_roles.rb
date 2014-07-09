class AddDescriptionToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :role_description, :string
  end
end
