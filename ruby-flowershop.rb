require_relative './flowershop'

#create an instance of flowershop
bouquet = {"Paris" => 130, "Lisbon" => 120, "Osaka" => 130, "Sydney" => 120, "Cannes" => 110, "London" => 100, "Barcelona" => 110, "Santorini" => 100} 
flowershop = Flowershop.new("Blossom House", bouquet)

flowershop.welcome
flowershop.print_bouquet  

loop do 
    puts
    puts "What would you like to order? When you are finished, please type 'done'."
    input = gets.strip.downcase

 #if users are done, break from loop
    if (input == 'done')
     break
    end

  # check for valid bouquet item
item = flowershop.bouquet.validate_item(input)
    if (item)
        puts "How many would you like?"
        quantity = gets.to_i
        if (quantity > 0)
             flowershop.add_to_order(item, quantity)
        end
    end
end

#print the order summary
flowershop.print_order