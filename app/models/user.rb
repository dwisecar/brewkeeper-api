class User < ApplicationRecord
  has_secure_password
  has_many :recipes
  has_many :reviews
  has_many :ratings
  validates :username, uniqueness: { case_sensitive: false }
end
