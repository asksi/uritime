class AddReferencesToGroupCalendars < ActiveRecord::Migration[5.2]
  def change
    add_reference :group_calendars, :user, null: false, foreign_key: true
  end
end
