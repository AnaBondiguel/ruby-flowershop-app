require_relative './flowershop'
require 'colorize'
require 'tty-prompt' 
prompt = TTY::Prompt.new

# create an instance of flowershop
bouquet = {"PARIS" => 130, "LISBON" => 120, "OSAKA" => 130, "SYDNEY" => 120, "CANNES" => 110, "LONDON" => 100, "BARCELONA" => 110, "SANTORINI" => 100}
flowershop = Flowershop.new("Blossom House", bouquet)

flowershop.welcome

loop do 
    flowershop.print_bouquet
    puts
    puts "What would you like to order? When you are finished, please type 'done'.".colorize(:blue)
    input = gets.strip.upcase
   
#  if users are done, break from loop
    if (input == 'DONE')
        break
    end

  # check for valid bouquet item
    item = flowershop.bouquet.validate_item(input)
        if (item)
            puts "How many would you like?".colorize(:blue)
         quantity = gets.to_i

        if (quantity > 0)
            flowershop.add_to_order(item, quantity)
        end
    end
end
# # print the order summary
flowershop.print_order
 