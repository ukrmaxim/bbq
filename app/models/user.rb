class User < ApplicationRecord
  USERNAME_REGEXP = /\A[a-zA-ZА-Яа-я\d]+\s*+[a-zA-ZА-Яа-я\d]+\z/
  USEREMAIL_REGEXP = /\A[\w.]+@[a-zа-я\d]+\.[a-zа-я]+\z/

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github]

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :photos, dependent: :destroy

  validates :name, presence: true, length: { maximum: 40 }, format: { with: USERNAME_REGEXP }
  validates :avatar, file_size: { less_than_or_equal_to: 1.megabyte }

  after_commit :link_subscriptions, on: :create

  mount_uploader :avatar, AvatarUploader

  def self.from_omniauth(auth)
    email = auth.info.email
    user = where(email: email).first
    return user if user.present?

    if auth.info.email.present?
      where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.name = auth.info.name
      end
    end
  end

  private

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end
end
