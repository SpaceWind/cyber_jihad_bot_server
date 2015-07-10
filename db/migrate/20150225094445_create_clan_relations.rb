class CreateClanRelations < ActiveRecord::Migration
  def change
    create_table :clan_relations do |t|
      t.string :rel_type
      t.string :rel_name
      t.text :hostile
      t.text :friendly
	  
      t.timestamps
    end
  end
end
