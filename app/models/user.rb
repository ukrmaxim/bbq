class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  #USERNAME_REGEXP = /\A\w\d+\z/
  # USEREMAIL_REGEXP = /\A[\w.]+@[a-zа-я\d]+\.[a-zа-я]+\z/

  has_many :events

  validates :name, presence: true, length: { maximum: 40 }#, format: { with: USERNAME_REGEXP }
  # validates :email, presence: true, uniqueness: true, format: { with: USEREMAIL_REGEXP }

  # При создании нового юзера (create), перед валидацией объекта выполнить
  # метод set_name
  before_validation :set_name, on: :create

  private

  # Задаем юзеру случайное имя, если оно пустое
  def set_name
    self.name = "Комрад #{rand(777)}" if self.name.blank?
  end
end
