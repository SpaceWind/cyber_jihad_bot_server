class CreateInventars < ActiveRecord::Migration
  def change
    create_table :inventars do |t|
      t.string :heroid
      t.string :item_id

      t.timestamps
    end
  end
end
