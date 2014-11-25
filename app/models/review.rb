class Review < ActiveRecord::Base
  validats :user_id, :stars, :listing_id, :content, presence: true
  belongs_to :user
  belongs_to :listing
end
