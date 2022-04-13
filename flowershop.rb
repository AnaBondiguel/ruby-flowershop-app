require_relative './bouquet'
require_relative './order'

class Flowershop
    attr_reader :name, :bouquet
    def initialize(name, bouquet_items)
        @name = name
        @bouquet = Bouquet.new
        populate_bouquet(bouquet_items)
        @order =Order.new
    end

    def populate_bouquet(bouquet_items)
        bouquet_items.each do |name, price|
            @bouquet.add_item(name,price)
        end
    end

    def add_to_order(item,quantity)
        @order.add_item(item, quantity)
    end

    def get_order
        return @order
    end

    def welcome
        puts "Welcome to #{@name}!"
    end

    def print_bouquet
        @bouquet.display
    end

    def order_total
        total = 0
        @order.get_items.each do |item,quantity|
            total += @bouquet.get_price(item) * quantity
        end
        return total
    end

    def print_order
        if @order 
            @order.display
            puts "Total:    $%.2f" % order_total
        else
            puts "Your order is empty. Thank you for coming!"
        end
       puts
    end

end
