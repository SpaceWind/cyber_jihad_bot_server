class CreatePartyStatuses < ActiveRecord::Migration
  def change
    create_table :party_statuses do |t|
      t.string :party
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
