Till tech test
==============

## Completion status

Travis CI status: [![Build Status](https://travis-ci.org/DanielJohnston/till_tech_test.svg)](https://travis-ci.org/DanielJohnston/till_tech_test)

Waffle.io status: [![Stories in Done](https://badge.waffle.io/DanielJohnston/till_tech_test.svg?label=done&title=Done)](http://waffle.io/DanielJohnston/till_tech_test)

The project uses Travis CI to test features as they were being built and submitted, Hound to check styling, and Waffle.io to manage the user stories and development tasks. The following user stories have been completed, in order:

- [x] As a customer, so I can select the items I would like to purchase, I would like to see a price list for the coffee shop
- [ ] As a staff member, so I can start building an order, I would like to add a menu item and quantity to an order and see the line total
- [ ] As a staff member, so I can calculate an order total, I would like to place a multi-line order using the price list and see the order total

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
