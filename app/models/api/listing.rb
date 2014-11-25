class Api::Listing < ActiveRecord::Base
  has_many :images
  has_many :reviews
  validates :name, :price, :available, :shop_id, :description, :policies, presence: true
end