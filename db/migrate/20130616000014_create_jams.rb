class CreateJams < ActiveRecord::Migration
  def change
    create_table :jams do |t|
      t.string :url

      t.timestamps
    end
  end
end
