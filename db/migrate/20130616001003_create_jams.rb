class CreateJams < ActiveRecord::Migration
  def change
    create_table :jams do |t|

      t.timestamps
    end
  end
end
