class Post < ApplicationRecord
  belongs_to :user
  
  
  mount_uploader :image, ImageUploader
  validates :comment, length: { maximum: 255 }
  validates :image, presence: { message: 'を選択してください。' }
  
  has_many :favorites, dependent: :destroy
  has_many :reverses_of_favorite, class_name: 'Favorite', foreign_key: 'post_id'
  has_many :likers, through: :reverses_of_favorite, source: :user
  
  
end
