class CreateRsvps < ActiveRecord::Migration[5.1]
  def change
    create_table :rsvps do |t|
      t.belongs_to :attendee
      t.belongs_to :attended_event

      t.timestamps
    end
  end
end
