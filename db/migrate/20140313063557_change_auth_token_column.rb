class ChangeAuthTokenColumn < ActiveRecord::Migration
  def up
   change_column :users, :auth_token, :text
  end

  def down
   change_column :users, :auth_token, :string
  end
end
