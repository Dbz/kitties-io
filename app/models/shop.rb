class Shop < ActiveRecord::Base
  has_many :listings
  has_many :reviews, through: :listings
  has_one :image
  belongs_to :user
  validates :name, :description, :policies, :user_id, presence: true
end