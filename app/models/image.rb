class Image < ActiveRecord::Base
  belongs_to :listing
  validates :url, :listing_id, presence: true
  
end
