class BouquetItem
  attr_reader :price, :name

  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    @name.to_s + ' ' * (10 - @name.length) + "... #{@price}"
  end
end
