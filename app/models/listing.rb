class Listing < ActiveRecord::Base
  has_many :images
  belongs_to :shop
  has_many :reviews, through: :shop
  validates :name, :price, :available, :shop_id, :description, presence: true
  
  def main_image
    listing.images.where({main_img: 1}).first
  end
end