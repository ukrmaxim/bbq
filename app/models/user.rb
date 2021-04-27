class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  USERNAME_REGEXP = /\A[a-zA-ZА-Яа-я\d]+\z/

  has_many :events

  validates :name, presence: true, length: { maximum: 40 }, format: { with: USERNAME_REGEXP }
end
