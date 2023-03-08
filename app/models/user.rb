class User < ApplicationRecord

  has_many :recipes, foreign_key: 'author_id'

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  validates :name, uniqueness: {message: "%{value} already exists!"}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, 
            format: { with: VALID_EMAIL_REGEX }
  validates :email, uniqueness: {message: "%{value} is already in use."}

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
