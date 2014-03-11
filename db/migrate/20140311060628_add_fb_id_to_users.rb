class AddFbIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fb_id, :big_int
  end
end
