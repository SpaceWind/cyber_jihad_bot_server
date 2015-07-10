class CreatePartyUpdates < ActiveRecord::Migration
  def change
    create_table :party_updates do |t|
      t.string :party
      t.string :rec
      t.datetime :date
      t.string :update_type
      t.string :nick
      t.text :message_text
      t.string :user_status
      t.string :server
      t.string :channel
      t.integer :cd
      t.string :method
      t.integer :before_attack
      t.integer :word_count_min
      t.integer :word_count_max
      t.string :list_name
      t.integer :max_emotes
      t.string :caps

      t.timestamps
    end
  end
end
