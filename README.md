till tech test
==============

brief
-----

build a simple till application to calculate the total amount due for each order.


user stories

------------

````
as a coffe shop owner
in order to calculate the right amount for each order
I want to be able to rely on a till


as a customer
in order to be able to review the amount
I want to receive a receit with my order and a total


````


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
