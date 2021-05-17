class Event < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user, dependent: :destroy
  has_many :photos, dependent: :destroy

  validates :address, :datetime, presence: true
  validates :title, presence: true, length: {maximum: 255}
end
