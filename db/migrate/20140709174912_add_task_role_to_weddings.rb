class AddTaskRoleToWeddings < ActiveRecord::Migration
  def change
    add_column :weddings, :task_id, :integer
    add_column :weddings, :role_id, :integer
  end
end
