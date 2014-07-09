class RemoveAttributesFromWeddings < ActiveRecord::Migration
  def change
    remove_column :weddings, :task_id
    remove_column :weddings, :role_id
  end
end
