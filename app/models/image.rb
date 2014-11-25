class Image < ActiveRecord::Base
  belongs_to :listing
  validates :url, :listing_id, presence: true
  validate :only_main_image
  
  def only_main_image
    if self.main_img == 1
      image = Image.where({ main_img: 1});
      image.main_img = 0;
      image.save
    end
  end
  
end
