class Post < ApplicationRecord
  belongs_to :user
  
  
  mount_uploader :image, ImageUploader
  validates :comment, length: { maximum: 255 }
  validates :image, presence: true
end
