class CreateSlotItems < ActiveRecord::Migration
  def change
    create_table :slot_items do |t|
      t.string :heroid
      t.string :item_id
      t.string :slot

      t.timestamps
    end
  end
end
