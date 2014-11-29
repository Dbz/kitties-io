class Listing < ActiveRecord::Base
  has_many :images
  belongs_to :shop
  has_many :reviews
  validates :name, :price, :available, :shop_id, :description, presence: true
  
  def main_image
    self.images.where({main_img: true}).first
  end
end