class Group < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :group_calendars, dependent: :destroy
end
