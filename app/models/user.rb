class User < ApplicationRecord
  USERNAME_REGEXP = /\A[a-zA-ZА-Яа-я\d]+\z/

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 40 }, format: { with: USERNAME_REGEXP }
end
