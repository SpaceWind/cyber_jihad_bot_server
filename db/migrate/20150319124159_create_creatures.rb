class CreateCreatures < ActiveRecord::Migration
  def change
    create_table :creatures do |t|
      t.string :creature_name
      t.string :mod
      t.string :creature_type
      t.integer :str
      t.integer :dex
      t.integer :mag
      t.integer :int
      t.integer :tra
      t.integer :vel
      t.integer :hp
      t.integer :mana
	  t.string :gender

      t.timestamps
    end
  end
end
