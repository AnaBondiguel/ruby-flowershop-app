require_relative './bouquet_item'

class Bouquet
  def initialize
    @bouquet_items = []
  end

  def add_item(name, price)
    bouquet_item = BouquetItem.new(name, price)
    @bouquet_items << bouquet_item
  end

  def get_price(name)
    item = @bouquet_items.find { |bouquet_item| bouquet_item.name == name }
    item.price
  end

  def get_items
    @bouquet_items
  end

  def display
    puts 'Bouquet'
    puts '-------------'
    @bouquet_items.each { |item| puts item }
    nil
  end

  def validate_item(name)
    @bouquet_items.each do |bouquet_item|
      return name if bouquet_item.name == name
    end
    nil
  end
end
