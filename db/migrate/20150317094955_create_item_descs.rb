class CreateItemDescs < ActiveRecord::Migration
  def change
    create_table :item_descs do |t|
      t.string :item_id
      t.string :item_name
      t.text :look
      t.string :owner_hero_id
      t.string :slot
      t.integer :value
      t.integer :worth
      t.integer :weight
      t.text :history

      t.timestamps
    end
  end
end
