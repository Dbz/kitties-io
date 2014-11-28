class Image < ActiveRecord::Base
  attr_accessor :main_img
  
  belongs_to :listing
  belongs_to :shop
  belongs_to :user
  
  validates :url, presence: true
  before_validation :only_main_image, :default_user_img
  after_validation :swap_user_image
  
  
  def only_main_image
    if self.main_img == 1
      img = Image.where({ main_img: 1}).where.not({ id: self.id });
      unless img.empty?
        img.first.main_img = 0;
        img.first.save
      end
    end
  end
  
  def default_user_img
    if self.user_id && !self.url
      self.url = "https://www.etsy.com/images/avatars/default_avatar_75px.png"
    end
  end
  
  def swap_user_image
    if(self.user_id)
      img = Image.where({ user_id: self.user_id}).where.not({ id: self.id })
      Image.destroy(img.first.id) unless img.empty?
    end
  end
      
  
end
