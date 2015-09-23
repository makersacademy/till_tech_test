Till tech test
==============

## Completion status

Travis CI status: [![Build Status](https://travis-ci.org/DanielJohnston/till_tech_test.svg)](https://travis-ci.org/DanielJohnston/till_tech_test)

[Waffle.io status](http://waffle.io/DanielJohnston/till_tech_test)

[Live demo site](https://tilltech.herokuapp.com/)

The project uses Travis CI to test features as they were being built and submitted, Hound to check styling, and Waffle.io to manage the user stories and development tasks. The following user stories have been completed, in order:

- [x] As a customer, so I can select the items I would like to purchase, I would like to see a price list for the coffee shop
- [x] As a staff member, so I can start building an order, I would like to add a menu item and quantity to an order and see the line total
- [x] As a staff member, so I can calculate an order total, I would like to place a multi-line order using the price list and see the order total including tax of 8.64%
- [x] As a staff member, so I can use the product in a real world environment, I would like the till's functionality to be presented through a user interface that I can interact with
- [x] As a staff member, so I can give the right change, I would like to enter payment and be told how much to give
- [x] As a staff member, so I can honour our bulk discount, I would like a 5% discount on order total over £50
- [x] As a staff member, so I can honour our muffin discount, I would like a 10% discount on all muffins to be applied to the order total
- [ ] As a staff member, so I can start a new order, I would like to press a button to finish or cancel the current order
- [ ] As a staff member, so I can remove an incorrect order line, I would like order lines to have a 'cancel' button that gets rid of them
- [ ] As a customer, so I have a receipt for my order, I would like a printable display of the order to be produced
- [ ] As a staff member, so I know whose order I'm preparing, I would like to be able to enter names of customers into the order screen and show them on the receipt
- [ ] As a store manager, so I can track sales, I would like completed, paid-for orders to be stored and retrievable

### Screenshot of actual bill

![actual till](/images/till_actual.png)

Note that the totals are different from the example image in the original spec. This appears to be because the original spec till takes tax off before discount, rather than taxing at the final discounted rate. Also, display currency is £ rather than $.

### Installation of Till Tech Test

Assuming a functional, unix-flavoured Ruby environment with Bundler installed, the following commands should set up a functioning till, likely at http://localhost:9292.

```
git clone https://github.com/DanielJohnston/till_tech_test.git
cd till_tech_test
bundler
rackup
```

To run feature tests / unit tests, run `rspec` from the project root. Note that, on some Linux installs, rspec can't find PhantomJS. This is because, when PhantomJS is installed via Bundler and Gemfile, it isn't added to $PATH. Solution for this is to either add it to $PATH manually, or run `apt-get install phantomjs`, although this isn't ideal as it removes versioning of the tool from Bundler's control.

## Original tech test specification

![a till](/images/till.jpg)

We want to sell tills to local hipster coffee shop who are finally embracing the 21st century. We need a new till to replace their vintage machines - unfortunately, hipster staff are too cool to learn a new system, so we need you to build something that they will understand.

Specification
-------------

This is what a sample receipt looks like:

![a receipt](/images/receipt.jpg)


Version 1
---------

Implement a system that contains the business logic to produce receipts similar to this, based on a `json` price list and test orders. A sample `.json` file has been provided with the list of products sold at this particular coffee shop.

Here are some sample orders you can try - whether you use this information is up to you:

> **Jane**  
> 2 x Cafe Latte  
> 1 x Blueberry Muffin  
> 1 x Choc Mudcake  
>
> **John**  
> 4 x Americano  
> 2 x Tiramisu  
> 5 x Blueberry Muffin  

Your receipt must calculate and show the correct amount of tax (in this shop's case, 8.64%), as well as correct line totals and total amount. Do not worry about calculating discounts or change yet. Consider what output formats may be suitable.

Version 2
---------

- Add functionality to take payment and calculate correct change.  
- Add functionality to handle discounts - in this example, a 5% discount on orders over $50, and a 10% muffin discount.

Version 3
---------

Implement an user interface that can actually be used as a till.

You may use whatever technologies you see fit.
