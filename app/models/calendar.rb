class Calendar < ApplicationRecord
    belongs_to :user
    
    validates :title, presence: true, length: { maximum: 50 }
    validates :start_time, presence: true
end
