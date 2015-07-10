class CreateHDescriptors < ActiveRecord::Migration
  def change
    create_table :h_descriptors do |t|
      t.string :hid
      t.string :hero_name
      t.integer :mood
	  t.integer :lvl
      t.text :map
      t.integer :pack_max_size
      t.integer :experience
      t.integer :exp_to_next_lvl
      t.integer :x_pos
      t.integer :y_pos
      t.string :hclass
      t.string :hrace

      t.timestamps
    end
  end
end
