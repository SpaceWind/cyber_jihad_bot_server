class CreateLibs < ActiveRecord::Migration
  def change
    create_table :libs do |t|
      t.string :token
      t.string :item
      t.text :value

      t.timestamps
    end
  end
end
