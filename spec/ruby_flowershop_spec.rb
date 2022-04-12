require_relative '../bouquet_item'
require_relative '../bouquet'
require_relative '../order'
require_relative '../flowershop'


describe BouquetItem do
    it 'should return the price of the item' do
        name = "Paris Rose" 
        price = 130 
        bouquet_item = BouquetItem.new(name,price)
        expect(bouquet_item.price).to eq(price)
    end
    it 'should return the name of the item' do
        name = "Paris Rose" 
        price = 130 
        bouquet_item = BouquetItem.new(name,price)
        expect(bouquet_item.name).to eq(name)
    end
end

describe Bouquet do
    it 'should be able to get an item price' do 
        name = "Paris Rose" 
        price = 130 
        bouquet = Bouquet.new
        bouquet.add_item(name,price)
        expect(bouquet.get_price(name)).to eq(price)
    end
    it 'should be able to add an item' do
        name = "Paris Rose" 
        price = 130 
        bouquet = Bouquet.new
        bouquet.add_item(name,price)
        expect(bouquet.get_items().length).to be(1)
    end
end

describe Order do
    it 'should add an item to the order' do
        order = Order.new
        name = "Paris"
        quantity = 2
        order.add_item(name,quantity)
        expect(order.get_items().length).to be(1)
    end
    it 'should update an item quantity' do
        order = Order.new
        name = "Paris"
        quantity = 2
        quantity_add = 3
        order.add_item(name,quantity)
        order.add_item(name,quantity_add)
        expect(order.get_items()[name]).to be(quantity+quantity_add)
    end
end

describe Flowershop do 
    it 'should create a flowershop with a name' do
        name = "Blossom House"
        bouquet_items = {}
        flowershop = Flowershop.new(name,bouquet_items)
        expect(flowershop.name).to eq(name)
    end
    it 'should create a flowershop with a bouquet' do
        name = "Blossom House"
        bouquet_items = {Paris: 130, Lisbon: 120}
        flowershop = Flowershop.new(name,bouquet_items)
        expect(flowershop.bouquet.get_items.length).to be(2)
    end
    it 'should add an item to order' do
        name = "Blossom House"
        bouquet_items = {Paris: 130, Lisbon: 120}
        flowershop = Flowershop.new(name,bouquet_items)
        item = "Paris"
        quantity = 1
        flowershop.add_to_order(item,quantity)
        expect(flowershop.get_order().get_items().length).to be(1)
    end
end
    
