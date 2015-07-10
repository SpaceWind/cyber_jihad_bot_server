class CreateSpells < ActiveRecord::Migration
  def change
    create_table :spells do |t|
      t.string :spell_name
      t.string :spell_class
      t.text :spell_desc

      t.timestamps
    end
  end
end
