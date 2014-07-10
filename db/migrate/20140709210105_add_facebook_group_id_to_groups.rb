class AddFacebookGroupIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :facebook_id, :string
    add_column :groups, :name, :string
    add_column :groups, :description, :string
    add_column :groups, :wedding_id, :integer
  end
end
