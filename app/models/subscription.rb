class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :user_name, presence: true, length: { maximum: 40 },
            format: { with: USERNAME_REGEXP }, unless: -> { user.present? }
  validates :user_email, presence: true, uniqueness: true,
            format: { with: USEREMAIL_REGEXP }, unless: -> { user
                                                                                                              .present? }
  validates :user, uniqueness: {scope: :event_id}, if: -> { user.present? }
  validates :user_email, uniqueness: {scope: :event_id}, unless: -> { user.present? }


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
end
