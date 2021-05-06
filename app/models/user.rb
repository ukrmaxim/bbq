class User < ApplicationRecord
  USERNAME_REGEXP = /\A[a-zA-ZА-Яа-я\d]+\z/
  USEREMAIL_REGEXP = /\A[\w.]+@[a-zа-я\d]+\.[a-zа-я]+\z/

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  validates :name, presence: true, length: { maximum: 40 }, format: { with: USERNAME_REGEXP }

  after_commit :link_subscriptions, on: :create

  private

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end
end
