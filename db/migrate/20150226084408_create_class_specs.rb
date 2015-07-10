class CreateClassSpecs < ActiveRecord::Migration
  def change
    create_table :class_specs do |t|
      t.string :class_name
      t.integer :str
      t.integer :dex
      t.integer :mag
	  t.integer :int
      t.integer :tra
      t.integer :vel
      t.integer :hp
      t.integer :mana
	  
      t.timestamps
    end
  end
end
