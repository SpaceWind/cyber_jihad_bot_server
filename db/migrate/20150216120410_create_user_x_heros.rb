class CreateUserXHeros < ActiveRecord::Migration
  def change
    create_table :user_x_heros do |t|
      t.string :login
      t.string :heroid

      t.timestamps
    end
  end
end
