class User < ActiveRecord::Base

  has_secure_password

  attr_accessible :email, :name, :surname, :title, :password, :password_confirmation

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }, length: { maximum: 50 }

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :surname, presence: true, length: { minimum: 3, maximum: 50 }
  validates :password, presence: true, length: { minimum: 5, maximum: 20 }
  validates :password_confirmation, presence: true

end
