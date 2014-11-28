class Image < ActiveRecord::Base
  attr_accessor :main_img
  
  belongs_to :listing
  belongs_to :shop
  belongs_to :user
  
  validates :url, :listing_id, presence: true
  validate :only_main_image
  
  def only_main_image
    if self.main_img == 1
      image = Image.where({ main_img: 1}).where.not({ id: self.id });
      image.main_img = 0;
      image.save
    end
  end
  
end
