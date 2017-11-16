class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.string :message
      t.belongs_to :invitee
      t.belongs_to :invited_event

      t.timestamps
    end
  end
end
