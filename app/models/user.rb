class User < ApplicationRecord
  has_secure_password

  has_many :reminders,  as: :imageable
  validates :username, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: { case_sensitive: false }
  validates :number, uniqueness: true

end
