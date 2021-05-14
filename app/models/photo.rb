class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :image, presence: true, file_size: { less_than_or_equal_to: 5.megabyte }

  mount_uploader :image, PhotoUploader
end
