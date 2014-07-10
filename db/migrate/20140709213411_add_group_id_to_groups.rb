class AddGroupIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :group_delete_id, :string
    add_column :groups, :facebook_grp_id, :string
    remove_column :groups, :facebook_id   
  end
end
