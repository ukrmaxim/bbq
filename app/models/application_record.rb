class ApplicationRecord < ActiveRecord::Base
  USERNAME_REGEXP = /\A[a-zA-ZА-Яа-я\d]+\z/
  USEREMAIL_REGEXP = /\A[\w.]+@[a-zа-я\d]+\.[a-zа-я]+\z/

  self.abstract_class = true
end
