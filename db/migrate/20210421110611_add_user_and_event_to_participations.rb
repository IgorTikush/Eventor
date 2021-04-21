class AddUserAndEventToParticipations < ActiveRecord::Migration[6.1]
  def change
    add_reference :participations, :attendee, null: false, foreign_key: {to_table: :users}
    add_reference :participations, :attended_event, null: false, foreign_key: {to_table: :events}
  end
end
