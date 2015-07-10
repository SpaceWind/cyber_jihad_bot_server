class CreateFactions < ActiveRecord::Migration
  def change
    create_table :factions do |t|
      t.string :faction_name
      t.string :lib_imp
      t.string :lib_rop
      t.string :lib_dap
      t.string :lib_vip
      t.string :lib_tvp
      t.string :lib_prp
      t.text :description

      t.timestamps
    end
  end
end
