class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
	  t.string :realname
	  t.string :group
	  t.text :description

      t.timestamps
    end
  end
end
