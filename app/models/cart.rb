class Cart < ActiveRecord::Base
  has_many :orders
  
  def add(id)
    order = self.orders.find_by({ listing_id: id })
    if order
      order.amount += 1
      order.save!
    else
      orders.create!({ listing_id: id })
    end
  end
end
