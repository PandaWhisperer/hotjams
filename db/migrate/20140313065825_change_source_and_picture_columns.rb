class ChangeSourceAndPictureColumns < ActiveRecord::Migration
  def up
   change_column :jams, :source, :text
   change_column :jams, :picture, :text
  end

  def down
   change_column :jams, :source, :string
   change_column :jams, :picture, :string
  end
end
