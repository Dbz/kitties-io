class Shop < ActiveRecord::Base
  has_many :listings
  has_many :reviews, through: :listings
  has_many :images
  belongs_to :user
  validates :name, :description, :policies, :user_id, presence: true
  
  def image
    self.images.where({ shop_banner: false }).first
  end
  
  def banner
    self.images.where({ shop_banner: true }).first
  end
end
