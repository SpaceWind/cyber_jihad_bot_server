class CreateItemOwners < ActiveRecord::Migration
  def change
    create_table :item_owners do |t|
      t.string :item_id
      t.string :heroid

      t.timestamps
    end
  end
end
