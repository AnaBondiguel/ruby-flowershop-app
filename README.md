# Ruby flower shop application

This is a flower shop "Blosson House" appplication written by Ruby.

You can tests by first running `bundle add` to add the rspec dependency, then run 
`rspec` in the project root directory to rub tests.

# R3 Full attribution to referenced sources
[TTY Component](https://ttytoolkit.org/components/)
[Rubocop](https://github.com/rubocop/rubocop)
[Colorize](https://github.com/fazibear/colorize)
[TTY-prompt](https://github.com/piotrmurach/tty-prompt)
[pastel](https://github.com/piotrmurach/pastel)
[TTY-font](https://github.com/piotrmurach/tty-font)
[JSON](https://ruby-doc.org/stdlib-2.6.3/libdoc/json/rdoc/JSON.html?ref=hackernoon.com)
[JSON-File](https://hackernoon.com/ruby-how-to-readwrite-json-file-a23h3vxa)
[Rspec](https://github.com/rspec/rspec-metagem/)
[RubyGems](https://rubygems.org/)
[Jarrod-examples](https://replit.com/@jarroddalefolin)

# A link of my source control repository
[My GitHub Application](git@github.com:AnaBondiguel/ruby-flowershop-app.git)

# Code styling conventions 
RuboCop is a Ruby static code analyzer (a.k.a. linter) and code formatter. Out of the box it will enforce many of the guidelines outlined in the community Ruby Style Guide. Apart from reporting the problems discovered in your code, RuboCop can also automatically fix many of them for you (Rubocop, 2022).

#	Develop a list of features that will be included in the application. It must include:
- Four Features: 
Display Welcome, Display Bouquets, Placing An Order, and Display Order and Total Order Price

- Describe Each Feature

Display Welcome:
Welcome message displays flower shop name

Display Bouquets:	
Bouquets displays menu items

Placing An Order:
1. Validate item using bouquets
2. Add item to order

Displays Order and Total Order Price:
1. Display order items from order
2. Display order cost using prices from bouquets and items in order

# Develop an implementation plan which:
- outlines how each feature will be implemented and a checklist of tasks for each feature

Feature 1. The BouquetItem class

Attributes: item price, item name

Actions: displays name and price of items

Checklist: methods, method parameters, method returns

Feature 2. The Bouquet class:

Attributes: bouquet items (array of BouquetItem), item price

Actions: add bouquet item, display menu, get price

Checklist: methods, method parameters, method returns, control structure

Feature 3. The Order class

Attributes: order items, item quantity

Actions: add item, get items, display order items

Checklist: methods, method parameters, method returns

Feature 4. The Flowershop class

Attributes: name (string), bouquet (bouquet), order(order)

Actions: display welcome, menu, and order with total, add item to order

Checklist: methods, method parameters, method returns, control structures


- prioritise the implementation of different features, or checklist items within a feature

 Building features from the lowest data structure to the highest one, and the order is: BouquetItem, Bouquet, Order, and Flowershop

1. Items in BouquetItem: the price of the item & the name of the item

2. Items in Bouquet: get an item price, add an item, display a list of bouquet items, the item name for a valide item, & return nil for invalid item

3. Items in Order: add an item to the order & update an item quantity

4. Items in Flowershop: the name of the flowershop, the bouquets of the flowershop, add an item to order, get an order,  define a welcome method, define a print_bouquet method, calculate order total, & define a print_order method.


- provide a deadline, duration or other time indicator for each feature or checklist/checklist-item

I used Trello for my project management. I set up each feature into different size projects, such as, large and extra large.

# Design help documentation which includes a set of instructions which accurately describe how to use and install the application.

- steps to install the application

Step 1 Break down the problem

Step 2 Define the data structure

Step 3 Write tests

Step 4 Write the application for the flower shop

- any dependencies required by the application to operate

gem "rspec", "~> 3.11"

gem "colorize"

gem 'rubocop'

gem 'tty-prompt', '~> 0.23.1'

gem 'tty-font'

gem "pastel"

gem'json'

- any system/hardware requirements
 
 Intalled rbenv 1.2.0 and ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-darwin19]

- how to use any command line arguments made for the application

I used the command line arguments for saying "hello" to the users with if and else statement
  if ARGV[0]
    customer_name = ARGV[0] 

  else
    customer_name = prompt.ask("What is your name?")

    puts "-----------------"
    puts "Hello, #{customer_name}!".colorize(:blue)
    puts ""
end