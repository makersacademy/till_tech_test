Till tech test
==============

Version 1
---------

coded in Ruby with tests in RSpec – by bat020 and zsid

the singleton class `Till` reads in two objects:

* `coffee_shop` contains the shop details: name, menu + prices, tax rate
* `customer_order` is a hash of items and quantities

it has four public methods:

* `line_entries` is an object keyed by item name, containing quantity, price per item and line total
* `total_before_tax` sums up all the line totals
* `bill_tax` is the tax rate times the total before tax
* `receipt` is an object bundling the above three data items plus the total including tax
