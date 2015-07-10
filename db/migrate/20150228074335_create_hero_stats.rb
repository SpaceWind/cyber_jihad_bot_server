class CreateHeroStats < ActiveRecord::Migration
  def change
    create_table :hero_stats do |t|
      t.string :heroid
      t.integer :str
      t.integer :dex
      t.integer :mag
	  t.integer :int
      t.integer :tra
      t.integer :vel
      t.integer :max_hp
      t.integer :max_mana
      t.integer :current_hp
      t.integer :current_mana
      t.integer :start_str
      t.integer :start_dex
      t.integer :start_mag
      t.integer :start_int
      t.integer :start_tra	
      t.integer :start_vel
      t.integer :start_hp
      t.integer :start_mana
      t.text :desc

      t.timestamps
    end
  end
end
