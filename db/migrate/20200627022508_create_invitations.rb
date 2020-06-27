class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.references :attendee, null: false, foreign_key: { to_table: :users}
      t.references :attended_event, null: false, foreign_key: { to_table: :events}
      t.boolean :accepted

      t.timestamps
    end
  end
end
