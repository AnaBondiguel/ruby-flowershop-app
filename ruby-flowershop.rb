require_relative './flowershop'
require 'colorize'
require 'tty-prompt' 
prompt = TTY::Prompt.new
require 'tty-font'
font = TTY::Font.new(:doom)
require 'json'

# create an instance of flowershop
bouquet = {"PARIS" => 130, "LISBON" => 120, "OSAKA" => 130, "SYDNEY" => 120, "CANNES" => 110, "LONDON" => 100, "BARCELONA" => 110, "SANTORINI" => 100}
flowershop = Flowershop.new("Blossom House", bouquet)

# say hello to customers
if ARGV[0]
     customer_name = ARGV[0] 
else
 begin
    customer_name = prompt.ask("What is your name?")
    raise InvalidNameError if customer_name.empty?
    puts "-----------------"
    puts "Hello, #{customer_name}!".colorize(:blue)
 rescue
    puts ""
rescue
    puts "Please enter your name!"
    retry
 end
end

# print welcome message and the marketing slogan
flowershop.welcome
pastel = Pastel.new
    puts pastel.red(font.write("Feel the Blossom"))
    puts pastel.blue(pastel.underline("Please choose your flowers from Bouquet:"))
    puts ""

#Print Bouquet Description from JSON file
puts "Bouquet Description".colorize(:red)
    puts ""
    file = File.read('./bouquet.json')
    data_hash = JSON.parse(file)
    data_hash.each do |key, value|
    puts "#{key}: #{value}"
    puts ""
end

loop do 
# Print bouquet price list
    flowershop.print_bouquet
    puts
    puts "What would you like to order? When you are finished, please type 'done'.".colorize(:blue)
    input = gets.strip.upcase
   
#  If users are done, break from loop
    if (input == 'DONE')
        break
    end

  # Check for valid bouquet item
    item = flowershop.bouquet.validate_item(input)
        if (item)
            puts "How many would you like?".colorize(:blue)
         quantity = gets.to_i

        if (quantity > 0)
            flowershop.add_to_order(item, quantity)
        end
    end
end

#  Print the order summary
flowershop.print_order

# Delivery service  
if flowershop.order_total > 0
    puts""
    puts "Do you need our delivery service?".colorize(:blue)
    answer = gets.chomp.downcase

    if answer == "yes"
        if ARGV[1]
            customer_address = ARGV[1]
        else
            customer_address = prompt.ask("Where would you like to be delivered?".colorize(:blue))
            puts "Your delivery fee is $30 for #{customer_address}. We'll send your flowers to your place shortly."
            puts "--------------------------------------"
            puts "Total: $#{flowershop.order_total + 30}"
            end
    elsif answer == "no"
            puts "----------------"
            puts "See you soon!".colorize(:blue)
# Raising input error
    else
            puts "Your input: #{answer} is invalid. Please enter yes or no answer!".colorize(:red)
            raise "Invalid Input"
    end

else
    puts "Have a nice day!".colorize(:red)
end

# Print email, address, website of the flowershop
puts ""
puts pastel.blue(pastel.italic("If you need to contact us, here is our contact detail:"))
my_hash = {:Email => "information@blossomhouse.com.au", :Phone => "0452807003", :Address => "8 Sunset Rd, Surry Hills, NSW2010", :Website => "www.Blossomhouse.com.au"}
my_hash.each do |key, value|
    puts "#{key}: #{value}".colorize(:green)
end