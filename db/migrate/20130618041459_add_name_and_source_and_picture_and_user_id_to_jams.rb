class AddNameAndSourceAndPictureAndUserIdToJams < ActiveRecord::Migration
  def change
    add_column :jams, :name, :string
    add_column :jams, :source, :string
    add_column :jams, :picture, :string
    add_column :jams, :user_id, :integer
  end
end
