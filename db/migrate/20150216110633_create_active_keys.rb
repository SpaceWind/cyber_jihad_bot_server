class CreateActiveKeys < ActiveRecord::Migration
  def change
	create_table :active_keys do |t|
      t.string :apikey
      t.string :login
      t.datetime :last_updated
      t.string :heroid
      t.datetime :last_controlled
      t.string :rolled_heroid
	  
      t.timestamps
    end
  end
end
