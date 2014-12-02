class Order < ActiveRecord::Base
  belongs_to :cart
  validates :cart_id, :listing_id, presence: true
end
