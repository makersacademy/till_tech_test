# Till tech test

Week 12, Hiring Week @ Makers Academy: Sample Tech test

https://github.com/makersacademy/till_tech_test


- My solution: Version 1 Pure Ruby code to be run in IRB/PRY
- Testing: RSPEC/CAPYBARA Feature & Unit tests

## Instructions:

I have implemented Version 1 with a focus on OOD

Clone the repo and run bundle:

```
$ git clone git@github.com:rodcul/till_tech_test.git
$ bundle install
```


Boot IRB/PRY and load till.rb:

`$ pry -r ./lib/till.rb`

Create a new till (also creates your first empty order):

`[1] pry(main)> till = Till.new`

Let's see what is available today:

```
[2] pry(main)> till.print_prices
Cafe Latte: 4.75
Flat White: 4.75
Cappucino: 3.85
Single Espresso: 2.05
Double Espresso: 3.75
Americano: 3.75
Cortado: 4.55
Tea: 3.65
Choc Mudcake: 6.4
Choc Mousse: 8.2
Affogato: 14.8
Tiramisu: 11.4
Blueberry Muffin: 4.05
Chocolate Chip Muffin: 4.05
Muffin Of The Day: 4.55
```

Nice, let's add 2 Chocolate Mudcakes to our order (yum!)

`[3] pry(main)> till.add_item("Choc Mudcake", 2)`

We also want to bring back something for our pair, let's get a muffin:

`[4] pry(main)> till.add_item("Blueberry Muffin", 1)`

We're all set for now, let's pay (this will also print an order summary):

```
[5] pry(main)> till.finish_order
Choc Mudcake - 2 x 6.4
Blueberry Muffin - 1 x 4.05
Tax: 1.46
Total 18.31
```
This will also create a new order so you're ready to go again!

## How to run tests

Tested using rspec & capybara

`$ rspec`

## Task list

- [x] Version 1
- [ ] Improve existing tests and add unit tests for Order
- [ ] Remove dependency I've created between Classes
- [ ] Remove hardcoding of 'hipstercoffee.json' and allow alternative .json files
- [ ] Version 2
- [ ] Version 3

### Version 1
Implement a system that contains the business logic to produce receipts similar to this, based on a `json` price list and test orders. A sample `.json` file has been provided with the list of products sold at this particular coffee shop.

Your receipt must calculate and show the correct amount of tax (in this shop's case, 8.64%), as well as correct line totals and total amount. Do not worry about calculating discounts or change yet. Consider what output formats may be suitable.

### Version 2 (PENDING)
- Add functionality to take payment and calculate correct change.  
- Add functionality to handle discounts - in this example, a 5% discount on orders over $50, and a 10% muffin discount.

### Version 3 (PENDING)
Implement an user interface that can actually be used as a till.
You may use whatever technologies you see fit.
