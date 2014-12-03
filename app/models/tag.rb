class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :shops, through: :taggings, source: :taggable, source_type: "Shop"
  has_many :listings, through: :taggings, source: :taggable, source_type: "Listing"
  
  validates :name, presence: true
  
  before_validation :lower_case
  
  def lower_case
    self.name.downcase!
  end
end
