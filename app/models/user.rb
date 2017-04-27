class User < ApplicationRecord
  has_many :reviews
  has_secure_password
  validates :password, confirmation: true, presence: true
  # validates :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true
  # validates :city, presence: true
  # validates :state, presence: true
  # validates :nurse_type, presence: true

end
