require_relative './bouquet'
require_relative './order'

class Flowershop
  attr_reader :name, :bouquet

  def initialize(name, bouquet_items)
    @name = name
    @bouquet = Bouquet.new
    populate_bouquet(bouquet_items)
    @order = Order.new
  end

  def populate_bouquet(bouquet_items)
    bouquet_items.each do |name, price|
      @bouquet.add_item(name, price)
    end
  end

  def add_to_order(item, quantity)
    @order.add_item(item, quantity)
  end

  def get_order
    @order
  end

  def welcome
    puts "Welcome to #{@name}!"
    puts
  end

  def print_bouquet
    @bouquet.display
  end

  def order_total
    total = 0
    @order.get_items.each do |item, quantity|
      total += @bouquet.get_price(item) * quantity
    end
    total
  end

  def print_order
    if @order.get_items.size > 0
      puts 'Thank you! Here is your order:'
      @order.get_items.each do |key, value|
        puts "#{key}: #{value}".colorize(:green)
      end

      puts '------------------'.colorize(:green)
      puts "Total: $#{order_total}"

    else
      puts '------------------'
      puts 'Your order is empty. Thank you for coming!'.colorize(:red)

    end
  end
end
