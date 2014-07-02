class RemoveTable < ActiveRecord::Migration
  def change
    drop_table :brides
  end
end
