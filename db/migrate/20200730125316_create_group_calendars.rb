class CreateGroupCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :group_calendars do |t|
      t.string :title
      t.text :content
      t.datetime :start_time
      t.datetime :end_time
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
