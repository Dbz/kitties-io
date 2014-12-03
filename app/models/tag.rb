class Tag < ActiveRecord::Base
  has_many :shops, through: :taggings
  has_many :listings, through: :taggings
  validates :name, presence: true
end
