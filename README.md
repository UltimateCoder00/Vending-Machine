# Vending Machine
### Contents
- [Summary](#summary)
- [Description](#description)
- [Installation](#installation)
- [Code In Interactive Ruby Shell (IRB)](#code_in_irb)
- [Test Driven Development (TDD) With Rspec](#tdd)

### <a name="summary">Summary</a>
A ruby application for buying items from a vending machine.

### <a name="description">Description</a>
Design a vending machine using ruby. The vending machine should perform as follows:
-	Once an item is selected and the appropriate amount of money is inserted, the vending machine should return the correct product.
-	It should also return change if too much money is provided, or ask for more money if insufficient funds have been inserted.
-	The machine should take an initial load of products and change. The change will be of denominations 1p, 2p, 5p, 10p, 20p, 50p, £1, £2.
-	There should be a way of reloading either products or change at a later point.
-	The machine should keep track of the products and change that it contains.

### <a name="installation">Installation</a>
Follow the instructions below to install and setup all the tools to use the Vending Machine code
##### Install Ruby Version Manager (RVM)
Open your terminal and type this line in:
```
\curl -L https://get.rvm.io | bash -s stable
```
##### Install Ruby 2.5.0
Open your terminal and type this line in:
```
rvm install ruby-2.5.0
```
##### Install Code to Local Device
To install the code on your local device, do the following:

* Clone repository
* `cd` to the project's root directory
* Run `gem install bundler`
* Run `bundle install` to install all of the required gems

### <a name="code_in_irb">Code In Interactive Ruby Shell (IRB) </a>
Open your terminal and run irb or pry, then run the program. Below are examples from the description above:
##### Example 1:
Once an item is selected and the appropriate amount of money is inserted, the vending machine should return the correct product.

```
λ irb
irb(main):001:0> require './lib/vending_machine'
=> true

irb(main):002:0> vending_machine = VendingMachine.new
=> #<VendingMachine:0x0000000002daca58 @stock=#<Stock:0x0000000002dac968 @price_list={"Coca Cola"=>80, "Coke Zero"=>70, "Diet Coke"=>70, "Fanta"=>80, "Sprite"=>80, "Pepsi"=>80, "Pepsi Max"=>70, "Dr Pepper"=>80, "7 Up"=>80, "Tango"=>75, "Irn Bru"=>75, "Lucozade"=>100, "Twix"=>65, "Kitkat"=>65, "Mars"=>65, "Snickers"=>65, "Twirl"=>60, "Cadbury Flake"=>60, "Maltesers"=>60, "Milky Way"=>60, "Skittles"=>60, "Hula Hoops Red"=>60, "Hula Hoops Blue"=>60, "Walkers Green"=>65, "Walkers Red"=>65, "Wotsits"=>60, "McCoys Blue"=>70, "McCoys Red"=>70, "French Fries"=>60, "Squares"=>60}, @product_quantity_list={"Coca Cola"=>10, "Coke Zero"=>10, "Diet Coke"=>10, "Fanta"=>10, "Sprite"=>10, "Pepsi"=>10, "Pepsi Max"=>10, "Dr Pepper"=>10, "7 Up"=>10, "Tango"=>10, "Irn Bru"=>10, "Lucozade"=>10, "Twix"=>10, "Kitkat"=>10, "Mars"=>10, "Snickers"=>10, "Twirl"=>10, "Cadbury Flake"=>10, "Maltesers"=>10, "Milky Way"=>10, "Skittles"=>10, "Hula Hoops Red"=>10, "Hula Hoops Blue"=>10, "Walkers Green"=>10, "Walkers Red"=>10, "Wotsits"=>10, "McCoys Blue"=>10, "McCoys Red"=>10, "French Fries"=>10, "Squares"=>10}>, @change_machine=#<ChangeMachine:0x0000000002d48490 @change={"1"=>0, "2"=>0, "5"=>0, "10"=>0, "20"=>0, "50"=>0, "100"=>0, "200"=>0}, @vault=#<MoneyVault:0x0000000002d48468 @coin_stored_list={"1"=>1000, "2"=>500, "5"=>200, "10"=>200, "20"=>100, "50"=>100, "100"=>100, "200"=>50}>>>

irb(main):003:0> vending_machine.stock.price_list["Fanta"]
=> 80

irb(main):004:0> vending_machine.stock.product_quantity_list["Fanta"]
=> 10

irb(main):005:0> vending_machine.change_machine.change
=> {"1"=>0, "2"=>0, "5"=>0, "10"=>0, "20"=>0, "50"=>0, "100"=>0, "200"=>0}

irb(main):006:0> vending_machine.add("50")
=> 1

irb(main):007:0> vending_machine.add("20")
=> 1

irb(main):008:0> vending_machine.add("10")
=> 1

irb(main):009:0> vending_machine.change_machine.change
=> {"1"=>0, "2"=>0, "5"=>0, "10"=>1, "20"=>1, "50"=>1, "100"=>0, "200"=>0}

irb(main):010:0> vending_machine.change_machine.vault.coin_stored_list
=> {"1"=>1000, "2"=>500, "5"=>200, "10"=>200, "20"=>100, "50"=>100, "100"=>100, "200"=>50}

irb(main):011:0> vending_machine.purchase("Fanta")
=> 9

irb(main):012:0> vending_machine.stock.product_quantity_list["Fanta"]
=> 9

irb(main):013:0> vending_machine.change_machine.change
=> {"1"=>0, "2"=>0, "5"=>0, "10"=>0, "20"=>0, "50"=>0, "100"=>0, "200"=>0}

irb(main):014:0> vending_machine.change_machine.vault.coin_stored_list
=> {"1"=>1000, "2"=>500, "5"=>200, "10"=>201, "20"=>101, "50"=>101, "100"=>100, "200"=>50}
```

##### Example 2:
It should also return change if too much money is provided, or ask for more money if insufficient funds have been inserted.

```
λ irb
irb(main):001:0> require './lib/vending_machine'
=> true

irb(main):002:0> vending_machine = VendingMachine.new
=> #<VendingMachine:0x000000000341ae80 @stock=#<Stock:0x000000000341ae58 @price_list={"Coca Cola"=>80, "Coke Zero"=>70, "Diet Coke"=>70, "Fanta"=>80, "Sprite"=>80, "Pepsi"=>80, "Pepsi Max"=>70, "Dr Pepper"=>80, "7 Up"=>80, "Tango"=>75, "Irn Bru"=>75, "Lucozade"=>100, "Twix"=>65, "Kitkat"=>65, "Mars"=>65, "Snickers"=>65, "Twirl"=>60, "Cadbury Flake"=>60, "Maltesers"=>60, "Milky Way"=>60, "Skittles"=>60, "Hula Hoops Red"=>60, "Hula Hoops Blue"=>60, "Walkers Green"=>65, "Walkers Red"=>65, "Wotsits"=>60, "McCoys Blue"=>70, "McCoys Red"=>70, "French Fries"=>60, "Squares"=>60}, @product_quantity_list={"Coca Cola"=>10, "Coke Zero"=>10, "Diet Coke"=>10, "Fanta"=>10, "Sprite"=>10, "Pepsi"=>10, "Pepsi Max"=>10, "Dr Pepper"=>10, "7 Up"=>10, "Tango"=>10, "Irn Bru"=>10, "Lucozade"=>10, "Twix"=>10, "Kitkat"=>10, "Mars"=>10, "Snickers"=>10, "Twirl"=>10, "Cadbury Flake"=>10, "Maltesers"=>10, "Milky Way"=>10, "Skittles"=>10, "Hula Hoops Red"=>10, "Hula Hoops Blue"=>10, "Walkers Green"=>10, "Walkers Red"=>10, "Wotsits"=>10, "McCoys Blue"=>10, "McCoys Red"=>10, "French Fries"=>10, "Squares"=>10}>, @change_machine=#<ChangeMachine:0x0000000002a58208 @change={"1"=>0, "2"=>0, "5"=>0, "10"=>0, "20"=>0, "50"=>0, "100"=>0, "200"=>0}, @vault=#<MoneyVault:0x0000000002a581e0 @coin_stored_list={"1"=>1000, "2"=>500, "5"=>200, "10"=>200, "20"=>100, "50"=>100, "100"=>100, "200"=>50}>>>

irb(main):003:0> vending_machine.add("50")
=> 1

irb(main):004:0> vending_machine.purchase("Pepsi")
Traceback (most recent call last):
        3: from C:/Ruby25-x64/bin/irb.cmd:19:in `<main>'
        2: from (irb):4
        1: from C:/Files/Dropbox/Projects/tech-test/Vending-Machine/lib/vending_machine.rb:13:in `purchase'
RuntimeError (You have insufficient change and need to add 30p more to buy a Pepsi)

irb(main):005:0> vending_machine.add("50")
=> 2

irb(main):006:0> vending_machine.purchase("Pepsi")
"Please collect your change of 20p"
=> 9
```

##### Example 3:
The machine should take an initial load of products and change. The change will be of denominations 1p, 2p, 5p, 10p, 20p, 50p, £1, £2.

```
λ irb
irb(main):001:0> require './lib/vending_machine'
=> true

irb(main):002:0> vending_machine = VendingMachine.new
=> #<VendingMachine:0x00000000031d31b8 @stock=#<Stock:0x00000000031d3140 @price_list={"Coca Cola"=>80, "Coke Zero"=>70, "Diet Coke"=>70, "Fanta"=>80, "Sprite"=>80, "Pepsi"=>80, "Pepsi Max"=>70, "Dr Pepper"=>80, "7 Up"=>80, "Tango"=>75, "Irn Bru"=>75, "Lucozade"=>100, "Twix"=>65, "Kitkat"=>65, "Mars"=>65, "Snickers"=>65, "Twirl"=>60, "Cadbury Flake"=>60, "Maltesers"=>60, "Milky Way"=>60, "Skittles"=>60, "Hula Hoops Red"=>60, "Hula Hoops Blue"=>60, "Walkers Green"=>65, "Walkers Red"=>65, "Wotsits"=>60, "McCoys Blue"=>70, "McCoys Red"=>70, "French Fries"=>60, "Squares"=>60}, @product_quantity_list={"Coca Cola"=>10, "Coke Zero"=>10, "Diet Coke"=>10, "Fanta"=>10, "Sprite"=>10, "Pepsi"=>10, "Pepsi Max"=>10, "Dr Pepper"=>10, "7 Up"=>10, "Tango"=>10, "Irn Bru"=>10, "Lucozade"=>10, "Twix"=>10, "Kitkat"=>10, "Mars"=>10, "Snickers"=>10, "Twirl"=>10, "Cadbury Flake"=>10, "Maltesers"=>10, "Milky Way"=>10, "Skittles"=>10, "Hula Hoops Red"=>10, "Hula Hoops Blue"=>10, "Walkers Green"=>10, "Walkers Red"=>10, "Wotsits"=>10, "McCoys Blue"=>10, "McCoys Red"=>10, "French Fries"=>10, "Squares"=>10}>, @change_machine=#<ChangeMachine:0x0000000002dc4540 @change={"1"=>0, "2"=>0, "5"=>0, "10"=>0, "20"=>0, "50"=>0, "100"=>0, "200"=>0}, @vault=#<MoneyVault:0x0000000002dc4518 @coin_stored_list={"1"=>1000, "2"=>500, "5"=>200, "10"=>200, "20"=>100, "50"=>100, "100"=>100, "200"=>50}>>>

irb(main):003:0> vending_machine.stock.price_list
=> {"Coca Cola"=>80, "Coke Zero"=>70, "Diet Coke"=>70, "Fanta"=>80, "Sprite"=>80, "Pepsi"=>80, "Pepsi Max"=>70, "Dr Pepper"=>80, "7 Up"=>80, "Tango"=>75, "Irn Bru"=>75, "Lucozade"=>100, "Twix"=>65, "Kitkat"=>65, "Mars"=>65, "Snickers"=>65, "Twirl"=>60, "Cadbury Flake"=>60, "Maltesers"=>60, "Milky Way"=>60, "Skittles"=>60, "Hula Hoops Red"=>60, "Hula Hoops Blue"=>60, "Walkers Green"=>65, "Walkers Red"=>65, "Wotsits"=>60, "McCoys Blue"=>70, "McCoys Red"=>70, "French Fries"=>60, "Squares"=>60}

irb(main):004:0> vending_machine.stock.product_quantity_list
=> {"Coca Cola"=>10, "Coke Zero"=>10, "Diet Coke"=>10, "Fanta"=>10, "Sprite"=>10, "Pepsi"=>10, "Pepsi Max"=>10, "Dr Pepper"=>10, "7 Up"=>10, "Tango"=>10, "Irn Bru"=>10, "Lucozade"=>10, "Twix"=>10, "Kitkat"=>10, "Mars"=>10, "Snickers"=>10, "Twirl"=>10, "Cadbury Flake"=>10, "Maltesers"=>10, "Milky Way"=>10, "Skittles"=>10, "Hula Hoops Red"=>10, "Hula Hoops Blue"=>10, "Walkers Green"=>10, "Walkers Red"=>10, "Wotsits"=>10, "McCoys Blue"=>10, "McCoys Red"=>10, "French Fries"=>10, "Squares"=>10}

irb(main):005:0> vending_machine.change_machine.change
=> {"1"=>0, "2"=>0, "5"=>0, "10"=>0, "20"=>0, "50"=>0, "100"=>0, "200"=>0}

irb(main):006:0> vending_machine.change_machine.vault.coin_stored_list
=> {"1"=>1000, "2"=>500, "5"=>200, "10"=>200, "20"=>100, "50"=>100, "100"=>100, "200"=>50}
```

##### Example 4:
There should be a way of reloading either products or change at a later point.

```
λ irb
irb(main):001:0> require './lib/stock'
=> true

irb(main):002:0> require './lib/money_vault'
=> true

irb(main):003:0> require './lib/change_machine'
=> true

irb(main):004:0> require './lib/vending_machine'
=> true

irb(main):005:0> stock = Stock.new
=> #<Stock:0x0000000003405698 @price_list={"Coca Cola"=>80, "Coke Zero"=>70, "Diet Coke"=>70, "Fanta"=>80, "Sprite"=>80, "Pepsi"=>80, "Pepsi Max"=>70, "Dr Pepper"=>80, "7 Up"=>80, "Tango"=>75, "Irn Bru"=>75, "Lucozade"=>100, "Twix"=>65, "Kitkat"=>65, "Mars"=>65, "Snickers"=>65, "Twirl"=>60, "Cadbury Flake"=>60, "Maltesers"=>60, "Milky Way"=>60, "Skittles"=>60, "Hula Hoops Red"=>60, "Hula Hoops Blue"=>60, "Walkers Green"=>65, "Walkers Red"=>65, "Wotsits"=>60, "McCoys Blue"=>70, "McCoys Red"=>70, "French Fries"=>60, "Squares"=>60}, @product_quantity_list={"Coca Cola"=>10, "Coke Zero"=>10, "Diet Coke"=>10, "Fanta"=>10, "Sprite"=>10, "Pepsi"=>10, "Pepsi Max"=>10, "Dr Pepper"=>10, "7 Up"=>10, "Tango"=>10, "Irn Bru"=>10, "Lucozade"=>10, "Twix"=>10, "Kitkat"=>10, "Mars"=>10, "Snickers"=>10, "Twirl"=>10, "Cadbury Flake"=>10, "Maltesers"=>10, "Milky Way"=>10, "Skittles"=>10, "Hula Hoops Red"=>10, "Hula Hoops Blue"=>10, "Walkers Green"=>10, "Walkers Red"=>10, "Wotsits"=>10, "McCoys Blue"=>10, "McCoys Red"=>10, "French Fries"=>10, "Squares"=>10}>

irb(main):006:0> money_vault = MoneyVault.new
=> #<MoneyVault:0x0000000002b99ab8 @coin_stored_list={"1"=>1000, "2"=>500, "5"=>200, "10"=>200, "20"=>100, "50"=>100, "100"=>100, "200"=>50}>

irb(main):007:0> change_machine = ChangeMachine.new(money_vault)
=> #<ChangeMachine:0x00000000024e5230 @change={"1"=>0, "2"=>0, "5"=>0, "10"=>0, "20"=>0, "50"=>0, "100"=>0, "200"=>0}, @vault=#<MoneyVault:0x0000000002b99ab8 @coin_stored_list={"1"=>1000, "2"=>500, "5"=>200, "10"=>200, "20"=>100, "50"=>100, "100"=>100, "200"=>50}>>

irb(main):008:0> vending_machine = VendingMachine.new(stock, change_machine)
=> #<VendingMachine:0x0000000002d7a738 @stock=#<Stock:0x0000000003405698 @price_list={"Coca Cola"=>80, "Coke Zero"=>70, "Diet Coke"=>70, "Fanta"=>80, "Sprite"=>80, "Pepsi"=>80, "Pepsi Max"=>70, "Dr Pepper"=>80, "7 Up"=>80, "Tango"=>75, "Irn Bru"=>75, "Lucozade"=>100, "Twix"=>65, "Kitkat"=>65, "Mars"=>65, "Snickers"=>65, "Twirl"=>60, "Cadbury Flake"=>60, "Maltesers"=>60, "Milky Way"=>60, "Skittles"=>60, "Hula Hoops Red"=>60, "Hula Hoops Blue"=>60, "Walkers Green"=>65, "Walkers Red"=>65, "Wotsits"=>60, "McCoys Blue"=>70, "McCoys Red"=>70, "French Fries"=>60, "Squares"=>60}, @product_quantity_list={"Coca Cola"=>10, "Coke Zero"=>10, "Diet Coke"=>10, "Fanta"=>10, "Sprite"=>10, "Pepsi"=>10, "Pepsi Max"=>10, "Dr Pepper"=>10, "7 Up"=>10, "Tango"=>10, "Irn Bru"=>10, "Lucozade"=>10, "Twix"=>10, "Kitkat"=>10, "Mars"=>10, "Snickers"=>10, "Twirl"=>10, "Cadbury Flake"=>10, "Maltesers"=>10, "Milky Way"=>10, "Skittles"=>10, "Hula Hoops Red"=>10, "Hula Hoops Blue"=>10, "Walkers Green"=>10, "Walkers Red"=>10, "Wotsits"=>10, "McCoys Blue"=>10, "McCoys Red"=>10, "French Fries"=>10, "Squares"=>10}>, @change_machine=#<ChangeMachine:0x00000000024e5230 @change={"1"=>0, "2"=>0, "5"=>0, "10"=>0, "20"=>0, "50"=>0, "100"=>0, "200"=>0}, @vault=#<MoneyVault:0x0000000002b99ab8 @coin_stored_list={"1"=>1000, "2"=>500, "5"=>200, "10"=>200, "20"=>100, "50"=>100, "100"=>100, "200"=>50}>>>

irb(main):009:0> vending_machine.change_machine.vault.coin_stored_list
=> {"1"=>1000, "2"=>500, "5"=>200, "10"=>200, "20"=>100, "50"=>100, "100"=>100, "200"=>50}

irb(main):010:0> money_vault.add("200", 10)
=> 60

irb(main):011:0> vending_machine.change_machine.vault.coin_stored_list
=> {"1"=>1000, "2"=>500, "5"=>200, "10"=>200, "20"=>100, "50"=>100, "100"=>100, "200"=>60}

irb(main):012:0> vending_machine.stock.product_quantity_list
=> {"Coca Cola"=>10, "Coke Zero"=>10, "Diet Coke"=>10, "Fanta"=>10, "Sprite"=>10, "Pepsi"=>10, "Pepsi Max"=>10, "Dr Pepper"=>10, "7 Up"=>10, "Tango"=>10, "Irn Bru"=>10, "Lucozade"=>10, "Twix"=>10, "Kitkat"=>10, "Mars"=>10, "Snickers"=>10, "Twirl"=>10, "Cadbury Flake"=>10, "Maltesers"=>10, "Milky Way"=>10, "Skittles"=>10, "Hula Hoops Red"=>10, "Hula Hoops Blue"=>10, "Walkers Green"=>10, "Walkers Red"=>10, "Wotsits"=>10, "McCoys Blue"=>10, "McCoys Red"=>10, "French Fries"=>10, "Squares"=>10}

irb(main):013:0> vending_machine.add("100")
=> 1

irb(main):014:0> vending_machine.purchase("Coca Cola")
"Please collect your change of 20p"
=> 9

irb(main):015:0> vending_machine.add("100")
=> 1

irb(main):016:0> vending_machine.purchase("Coca Cola")
"Please collect your change of 20p"
=> 8

irb(main):017:0> vending_machine.add("100")
=> 1

irb(main):018:0> vending_machine.purchase("Coca Cola")
"Please collect your change of 20p"
=> 7

irb(main):019:0> vending_machine.stock.product_quantity_list
=> {"Coca Cola"=>7, "Coke Zero"=>10, "Diet Coke"=>10, "Fanta"=>10, "Sprite"=>10, "Pepsi"=>10, "Pepsi Max"=>10, "Dr Pepper"=>10, "7 Up"=>10, "Tango"=>10, "Irn Bru"=>10, "Lucozade"=>10, "Twix"=>10, "Kitkat"=>10, "Mars"=>10, "Snickers"=>10, "Twirl"=>10, "Cadbury Flake"=>10, "Maltesers"=>10, "Milky Way"=>10, "Skittles"=>10, "Hula Hoops Red"=>10, "Hula Hoops Blue"=>10, "Walkers Green"=>10, "Walkers Red"=>10, "Wotsits"=>10, "McCoys Blue"=>10, "McCoys Red"=>10, "French Fries"=>10, "Squares"=>10}

irb(main):020:0> stock.add("Coca Cola", 2)
=> 9

irb(main):021:0> vending_machine.stock.product_quantity_list
=> {"Coca Cola"=>9, "Coke Zero"=>10, "Diet Coke"=>10, "Fanta"=>10, "Sprite"=>10, "Pepsi"=>10, "Pepsi Max"=>10, "Dr Pepper"=>10, "7 Up"=>10, "Tango"=>10, "Irn Bru"=>10, "Lucozade"=>10, "Twix"=>10, "Kitkat"=>10, "Mars"=>10, "Snickers"=>10, "Twirl"=>10, "Cadbury Flake"=>10, "Maltesers"=>10, "Milky Way"=>10, "Skittles"=>10, "Hula Hoops Red"=>10, "Hula Hoops Blue"=>10, "Walkers Green"=>10, "Walkers Red"=>10, "Wotsits"=>10, "McCoys Blue"=>10, "McCoys Red"=>10, "French Fries"=>10, "Squares"=>10}
```

##### Example 5:
The machine should keep track of the products and change that it contains.

```
λ irb
irb(main):001:0> require './lib/vending_machine'
=> true

irb(main):002:0> vending_machine = VendingMachine.new
=> #<VendingMachine:0x000000000336f3c8 @stock=#<Stock:0x000000000336f3a0 @price_list={"Coca Cola"=>80, "Coke Zero"=>70, "Diet Coke"=>70, "Fanta"=>80, "Sprite"=>80, "Pepsi"=>80, "Pepsi Max"=>70, "Dr Pepper"=>80, "7 Up"=>80, "Tango"=>75, "Irn Bru"=>75, "Lucozade"=>100, "Twix"=>65, "Kitkat"=>65, "Mars"=>65, "Snickers"=>65, "Twirl"=>60, "Cadbury Flake"=>60, "Maltesers"=>60, "Milky Way"=>60, "Skittles"=>60, "Hula Hoops Red"=>60, "Hula Hoops Blue"=>60, "Walkers Green"=>65, "Walkers Red"=>65, "Wotsits"=>60, "McCoys Blue"=>70, "McCoys Red"=>70, "French Fries"=>60, "Squares"=>60}, @product_quantity_list={"Coca Cola"=>10, "Coke Zero"=>10, "Diet Coke"=>10, "Fanta"=>10, "Sprite"=>10, "Pepsi"=>10, "Pepsi Max"=>10, "Dr Pepper"=>10, "7 Up"=>10, "Tango"=>10, "Irn Bru"=>10, "Lucozade"=>10, "Twix"=>10, "Kitkat"=>10, "Mars"=>10, "Snickers"=>10, "Twirl"=>10, "Cadbury Flake"=>10, "Maltesers"=>10, "Milky Way"=>10, "Skittles"=>10, "Hula Hoops Red"=>10, "Hula Hoops Blue"=>10, "Walkers Green"=>10, "Walkers Red"=>10, "Wotsits"=>10, "McCoys Blue"=>10, "McCoys Red"=>10, "French Fries"=>10, "Squares"=>10}>, @change_machine=#<ChangeMachine:0x0000000002ecc5a0 @change={"1"=>0, "2"=>0, "5"=>0, "10"=>0, "20"=>0, "50"=>0, "100"=>0, "200"=>0}, @vault=#<MoneyVault:0x0000000002ecc578 @coin_stored_list={"1"=>1000, "2"=>500, "5"=>200, "10"=>200, "20"=>100, "50"=>100, "100"=>100, "200"=>50}>>>

irb(main):003:0> vending_machine.stock.product_quantity_list
=> {"Coca Cola"=>10, "Coke Zero"=>10, "Diet Coke"=>10, "Fanta"=>10, "Sprite"=>10, "Pepsi"=>10, "Pepsi Max"=>10, "Dr Pepper"=>10, "7 Up"=>10, "Tango"=>10, "Irn Bru"=>10, "Lucozade"=>10, "Twix"=>10, "Kitkat"=>10, "Mars"=>10, "Snickers"=>10, "Twirl"=>10, "Cadbury Flake"=>10, "Maltesers"=>10, "Milky Way"=>10, "Skittles"=>10, "Hula Hoops Red"=>10, "Hula Hoops Blue"=>10, "Walkers Green"=>10, "Walkers Red"=>10, "Wotsits"=>10, "McCoys Blue"=>10, "McCoys Red"=>10, "French Fries"=>10, "Squares"=>10}

irb(main):004:0> vending_machine.change_machine.vault
=> #<MoneyVault:0x0000000002ecc578 @coin_stored_list={"1"=>1000, "2"=>500, "5"=>200, "10"=>200, "20"=>100, "50"=>100, "100"=>100, "200"=>50}>

irb(main):005:0> vending_machine.add("10")
=> 1

irb(main):006:0> vending_machine.add("10")
=> 2

irb(main):007:0> vending_machine.add("5")
=> 1

irb(main):008:0> vending_machine.add("50")
=> 1

irb(main):009:0> vending_machine.add("50")
=> 2

irb(main):010:0> vending_machine.total_change_given
=> 125

irb(main):011:0> vending_machine.purchase("Tango")
"Please collect your change of 50p"
=> 9

irb(main):012:0> vending_machine.stock.product_quantity_list
=> {"Coca Cola"=>10, "Coke Zero"=>10, "Diet Coke"=>10, "Fanta"=>10, "Sprite"=>10, "Pepsi"=>10, "Pepsi Max"=>10, "Dr Pepper"=>10, "7 Up"=>10, "Tango"=>9, "Irn Bru"=>10, "Lucozade"=>10, "Twix"=>10, "Kitkat"=>10, "Mars"=>10, "Snickers"=>10, "Twirl"=>10, "Cadbury Flake"=>10, "Maltesers"=>10, "Milky Way"=>10, "Skittles"=>10, "Hula Hoops Red"=>10, "Hula Hoops Blue"=>10, "Walkers Green"=>10, "Walkers Red"=>10, "Wotsits"=>10, "McCoys Blue"=>10, "McCoys Red"=>10, "French Fries"=>10, "Squares"=>10}

irb(main):013:0> vending_machine.change_machine.vault
=> #<MoneyVault:0x0000000002ecc578 @coin_stored_list={"1"=>1000, "2"=>500, "5"=>201, "10"=>202, "20"=>100, "50"=>101, "100"=>100, "200"=>50}>
```

### <a name="tdd">Test Driven Development (TDD) With Rspec</a>
This program was developed using Rspec. To run the tests, in the terminal type:
```
rspec
```
This will return the following output:
```
ChangeMachine
  #add
    Add change
    Adding invalid coin
  #total_change
    Count total change
  #return_given_change
    Return change given to machine
  #return_change
    Return change 1
    Return change 2

MoneyVault
  #add
    Add coin to coin bank
    Add multiple quantities of a coin
    Adding invalid coin to coin bank
  #remove
    Remove coin from coin bank
    Remove finished coin from coin bank
    Removing invalid coin from coin bank

Stock
  #add
    Add product to stock
    Add multiple quantities of a product
    Adding invalid product to stock
    Add more product than max allowed
  #remove
    Remove product from stock
    Remove out of stock product from stock
    Removing invalid product from stock

VendingMachine
  #add_coin
    Add change
  #purchase
    Select item
    insufficient change
"Please collect your change of 270p"
    extra money given
  #total_change_given
    Count total change
  #return_change
    Return change given to machine

Finished in 0.03041 seconds (files took 0.52371 seconds to load)
25 examples, 0 failures
```
