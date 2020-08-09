class GroupCalendar < ApplicationRecord
  belongs_to :group
  belongs_to :user, optional: true
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :start_time, presence: true
end
