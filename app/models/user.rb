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

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

  def avg
     divisor = self.reviews.count > 0 ? self.reviews.count : 1
     self.reviews.inject(0) {|sum, el| sum + el.rating unless el.rating.nil? } / divisor
  end
end
