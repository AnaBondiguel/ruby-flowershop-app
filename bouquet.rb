require_relative './bouquet_item'

class Bouquet
    def initialize
        @bouquet_items = []
    def add_item(name,price)
        bouquet_item = BouquetItem.new(name,price)
        @bouquet_items << bouquet_item
    end
    def get_price(name)
        item = @bouquet_items.find {|bouquet_item| bouquet_item.name==name}
        return item.price
    end
    def get_items
        return @bouquet_items
    end
    end
end