class Order < ActiveRecord::Base
  belongs_to :cart
  belongs_to :listing
  has_many :shops, through: :listing
  validates :cart_id, :listing_id, presence: true
  
end
