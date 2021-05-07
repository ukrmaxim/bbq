class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :body, presence: true
  validates :user_name, presence: true, length: { maximum: 40 },
            format: { with: User::USERNAME_REGEXP }, unless: -> { user.present? }

  def user_name
    user&.name || super
  end
end
