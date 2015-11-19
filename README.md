Till tech test
==============

Version 2
---------

Coded in Ruby with tests in RSpec – by bat020 and zsid

The singleton class `Till` reads in two objects:

* `coffee_shop` contains the shop details: prices, tax rate, discounts
* `customer_order` is a hash containing order information and customer payment

It has four public methods:

* `items` is a hash keyed by item name, containing quantity, price per item and line total
* `items_total` sums up all the line totals
* `discounts` is a hash containing the order's item and bill discounts
* `total_inc_discounts` is the total including discounts but before tax
* `bill_tax` is the tax rate times the total before tax
* `total_inc_tax` is the total including discounts and tax
* `change` is the customer payment minus the total bill (inc tax and discounts)
* `receipt` is a hash bundling all the above data

Discounts are of two types: item discounts (eg '10% off muffins') and a bill discount (eg '5% off bills of over $50'). They are applied independently (ie we calculate all the relevant discounts then apply them simultaneously rather than first applying the item discounts, then the bill discount). Thus you still get the 5% off a bill of over $50 even if your muffins discount takes the bill down to below $50, and the 5% is calculated on the bill before the muffin discount. This is the most 'customer friendly' way of calculating the bill.
