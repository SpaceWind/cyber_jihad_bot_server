class CreateSpamItems < ActiveRecord::Migration
  def change
    create_table :spam_items do |t|
      t.string :list_name
      t.text :data

      t.timestamps
    end
  end
end
