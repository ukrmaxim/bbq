class Event < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy

  validates :address, :datetime, presence: true
  validates :title, presence: true, length: {maximum: 255}
end
