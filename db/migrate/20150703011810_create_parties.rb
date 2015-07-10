class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.string :pass
	  t.string :owner

      t.timestamps
    end
  end
end
