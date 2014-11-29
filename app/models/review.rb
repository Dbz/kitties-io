class Review < ActiveRecord::Base
  validates :user_name, :user_id, :stars, :listing_id, :content, presence: true
  belongs_to :user
  belongs_to :listing
end
