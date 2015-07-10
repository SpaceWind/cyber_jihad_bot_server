class CreateAccountBans < ActiveRecord::Migration
  def change
    create_table :account_bans do |t|
      t.string :login
      t.string :channel

      t.timestamps
    end
  end
end
