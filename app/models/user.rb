class User < ApplicationRecord
  USERNAME_REGEXP = /\A\w+\z/
  USEREMAIL_REGEXP = /\A[\w.]+@[a-zа-я\d]+\.[a-zа-я]+\z/

  has_many :events

  validates :name, presence: true, length: { maximum: 40 }, format: { with: USERNAME_REGEXP }
  validates :email, presence: true, uniqueness: true, format: { with: USEREMAIL_REGEXP }
end
