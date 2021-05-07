class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  with_options unless: -> { user.present? } do
    validates :user_name, presence: true, length: { maximum: 40 }, format: { with: User::USERNAME_REGEXP }
    validates :user_email, presence: true, format: { with: User::USEREMAIL_REGEXP }
    validates :user_email, uniqueness: { scope: :event_id }
    validate  :check_email_not_registered
  end

  with_options if: -> { user.present? } do
    validates :user, uniqueness: { scope: :event_id }
    validate  :decline_self_subscription
  end

  def user_name
    user&.name || super
  end

  def user_email
    user&.email || super
  end

  private

  def decline_self_subscription
    errors.add(:base, :decline_self_subscription) if user.id == event.user.id
  end

  def check_email_not_registered
    errors.add(:base, :email_exists) if User.where(email: "#{user_email}").present?
  end
end
