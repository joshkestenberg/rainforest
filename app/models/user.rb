class User < ApplicationRecord

  validates :name, presence: true
  
  has_many :reviews
  has_many :products, through: :reviews

  has_secure_password
end
