class Order < ActiveRecord::Base
  belongs_to :cart
  belongs_to :listing
  validates :cart_id, :listing_id, presence: true
  
end
