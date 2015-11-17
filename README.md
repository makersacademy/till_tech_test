Till tech test
==============

*Instructions*: Please fork this repo and submit a pull request once you've finished. Then prepare for code review!

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

---------
Test check that:
 - 1. We can see the list of the customer order
 - 2. We can see prices and quantity of products in customer bill
 - 3. We can see the final sum of the bill
 - 4. We can see the tax of the final sum of the bill
 - 5. We can see price with 5% discount in case our purchase is more than 50$
 - 6. We can see the discount separately in our bill
 - 7. We can see the change of the customer
 - 8. We can see the discount to various maffins

 Program has 1 class Menu and methods  
 - `def Initialize` (set our vars and grab data from `json` file)
 - `def order` (compare each customer order with data from `json` file, also add quantity of each product and check muffin discount)
 - `def prices` (see price of each ordered product separately)
 - `def sum` (see total sum of bill, and make a discount in case the bill is more than 50$)
 - `def taxes` (show the taxes)
 - `def discount` (show amount of discount separately)
 - `def money` (show amount of money which gives customer)
 - `def charge` (show the change which gets customer)
