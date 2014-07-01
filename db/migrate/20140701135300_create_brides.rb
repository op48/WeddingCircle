class CreateBrides < ActiveRecord::Migration
  def change
    create_table :brides do |t|

      t.timestamps
    end
  end
end
