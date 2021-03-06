class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :orders, dependent: :destroy # => product.orders
  has_many :reviews, through: :orders # => def #reviews Product.reviews
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :cart_items, dependent: :destroy
  has_rich_text :rich_body
  monetize :price_cents

  validates :name, presence: true
end
