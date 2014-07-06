class AddColumnsToWeddings < ActiveRecord::Migration
  def change
    add_column :weddings, :title, :string
    add_column :weddings, :wedding_date, :date
  end
end
