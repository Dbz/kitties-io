class Cart < ActiveRecord::Base
  has_many :orders
end
