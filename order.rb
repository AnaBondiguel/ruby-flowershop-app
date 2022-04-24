class Order
  def initialize
    @order_items = Hash.new(0)
  end

  def add_item(name, quantity)
    @order_items[name] += quantity
  end

  def get_items
    @order_items
  end
end
