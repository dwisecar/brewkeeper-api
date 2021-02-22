class User < ApplicationRecord
  has_secure_password
  has_many :recipies
  validates :username, uniqueness: { case_sensitive: false }
end