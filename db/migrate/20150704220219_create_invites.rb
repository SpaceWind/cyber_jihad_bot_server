class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :data
      t.string :sender

      t.timestamps
    end
  end
end
