class AddAttributesToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :title, :string
    add_column :tasks, :task_details, :text
    add_column :tasks, :date_time_due, :timestamp
    add_column :tasks, :location, :string
    add_column :tasks, :latitude, :float
    add_column :tasks, :longitude, :float
  end
end
