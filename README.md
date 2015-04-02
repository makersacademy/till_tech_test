![build-badge](https://travis-ci.org/lukeclewlow/till_tech_test.svg?branch=master)
[![Code Climate](https://codeclimate.com/github/lukeclewlow/till_tech_test/badges/gpa.svg)](https://codeclimate.com/github/lukeclewlow/till_tech_test)
[![Test Coverage](https://codeclimate.com/github/lukeclewlow/till_tech_test/badges/coverage.svg)](https://codeclimate.com/github/lukeclewlow/till_tech_test)

Till tech test
==============

![a till](/app/public/images/till.jpg)

We want to sell tills to local hipster coffee shop who are finally embracing the 21st century. We need a new till to replace their vintage machines - unfortunately, hipster staff are too cool to learn a new system, so we need you to build something that they will understand.

Please see bottom of page for comments

Specification
-------------

This is what a sample receipt looks like:

![a receipt](/app/public/images/receipt.jpg)


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

Things I would do differently if i had time
-------------------------------------------

- I would double for all tests and stub methods where neccessary as I think this would make me think more carefully about how different classes are interacting
- I would not use float to represent the prices as this causes the need for lots of rounding and I have been reading about possible problems with this. I have seen there are some relevant gems I could use to monetise values.
- Make adjustments a module instead of a class, I kept it as a class because I wanted to have the initialized variables easily accessible, but really it is just doing calculations and perhaps these details should belong elsewhere
- I struggled to keep my controller skinny for the receipt page as there were lots of variables I needed to render on the page. I managed to extract some of the logic to the till, but I would also split that out to another class if I had time.