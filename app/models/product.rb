class Product < ApplicationRecord
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :quantity, presence: true
  validates :category, presence: true

  def no_stock?
    quantity == 0
  end
  
end
