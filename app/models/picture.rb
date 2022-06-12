class Picture < ApplicationRecord
  belongs_to :user
  validates :content, length: { in: 1..140 } 
  mount_uploader :image, ImageUploader
end

