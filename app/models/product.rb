class Product < ApplicationRecord
  validates :description, :name, :image_url, presence:true
  validates :price_in_cents, numericality: {only_integer: true}
end
