class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group
  
  validates :content, presence: :true, length: { maximum: 255 }
  mount_uploader :image, ImageUploader

end
