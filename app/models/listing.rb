class Listing < ActiveRecord::Base
  has_many :images
  belongs_to :shop
  has_many :reviews
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings
  validates :name, :price, :available, :shop_id, :description, presence: true
  
  def main_image
    self.images.where({main_img: true}).first
  end
  
  def self.search(params)
      where("name ILIKE '%#{params}%' OR description ILIKE '%#{params}%'")
  end
end