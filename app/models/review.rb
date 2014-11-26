class Review < ActiveRecord::Base
  validates :user_name, :user_id, :stars, :shop_id, :content, presence: true
  belongs_to :user
  belongs_to :shop
end
