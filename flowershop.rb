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
end

name = "Blossom House"
bouquet_items = {Paris: 130, Lisbon: 120}
flowershop = Flowershop.new(name,bouquet_items)
flowershop.welcome
flowershop.print_bouquet
