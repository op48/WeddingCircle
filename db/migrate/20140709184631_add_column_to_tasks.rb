class AddColumnToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :wedding_id, :integer
  end
end
