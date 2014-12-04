class Cart < ActiveRecord::Base
  has_many :orders
  has_many :shops, through: :orders
  
  def add(id)
    order = self.orders.find_by({ listing_id: id })
    if order
      order.amount += 1
      order.save!
    else
      orders.create!({ listing_id: id })
    end
  end
  
  def remove(id)
    order = self.orders.find_by({ id: id }).destroy()
  end
  
  def remove_by_shop(shop_id)
    self.orders_by_shop(shop_id).map { |order| order.destroy() }
  end
  
  def orders_by_shop(shop_id)
    self.orders.select { |order| order.listing.shop_id == shop_id }
  end
end
