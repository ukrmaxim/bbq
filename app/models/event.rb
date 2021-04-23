class Event < ApplicationRecord
  belongs_to :user

  validates :user, :address, :datetime, presence: true
  validates :title, presence: true, length: {maximum: 255}
end
