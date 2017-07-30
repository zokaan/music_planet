class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  before_save { email.downcase! }

  validates :name, presence: true, length: { minimum: 3, maximim: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
            format: {with: VALID_EMAIL_REGEX }
end
