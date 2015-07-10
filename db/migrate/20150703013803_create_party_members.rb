class CreatePartyMembers < ActiveRecord::Migration
  def change
    create_table :party_members do |t|
      t.string :party
      t.string :member
      t.string :status

      t.timestamps
    end
  end
end
