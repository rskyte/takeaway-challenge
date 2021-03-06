require_relative 'menu'

class Order
  attr_reader :orders, :price, :time

  def initialize(orders, quantities, price)
    @orders = orders
    @quantities = quantities
    @price = price
    @time = Time.now
  end

  def translate(menu)
    trans = []
    @orders.size.times do |y|
      trans << menu.show_menu.select { |dish| dish.item_id == @orders[y] }
    end
    @orders = trans.flatten
  end

  def correct?
    @orders.zip(@quantities)
    .map { |order, num| order.price * num }.inject(:+) == @price
  end

  def delivery_time
    del = @time + 3600
    del.strftime("%H:%M")
  end

end
