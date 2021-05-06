class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  with_options unless: -> { user.present? } do
    validates :user_name, presence: true, length: { maximum: 40 }, format: { with: User::USERNAME_REGEXP }
    validates :user_email, presence: true, format: { with: User::USEREMAIL_REGEXP }
    validates :user_email, uniqueness: { scope: :event_id }
  end

  with_options if: -> { user.present? } do
    validates :user, uniqueness: { scope: :event_id }
    validate :disable_subscription
  end

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  private

  def disable_subscription
    errors.add(:user_id, message: I18n.t('errors.disable_subscription')) if user.id == event.user.id
  end
end
