class CreateSpamLists < ActiveRecord::Migration
  def change
    create_table :spam_lists do |t|
      t.string :owner
      t.string :listname

      t.timestamps
    end
  end
end
