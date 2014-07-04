class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_id, :bigint
    add_column :users, :access_token, :string
  end
end
