class CreateCreatureXSpells < ActiveRecord::Migration
  def change
    create_table :creature_x_spells do |t|
      t.string :spell_class
      t.string :spell_name
      t.string :creature_type
      t.string :creature_name
      t.string :mod
      t.string :prefix_name
      t.string :suffix_name

      t.timestamps
    end
  end
end
