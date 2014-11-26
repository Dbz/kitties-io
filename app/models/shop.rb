class Shop < ActiveRecord::Base
  has_many :listings
  has_many :reviews
  belongs_to :user
  validates :name, :description, :policies, :user_id, presence: true
end
