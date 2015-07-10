class CreateSpamAccounts < ActiveRecord::Migration
  def change
    create_table :spam_accounts do |t|
      t.string :login
      t.string :pass
      t.string :owner

      t.timestamps
    end
  end
end
