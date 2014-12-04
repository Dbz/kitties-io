class Follow < ActiveRecord::Base
  has_many :followings
  has_many :shops, through: :followings
  has_many :listings, through: :followings
end
