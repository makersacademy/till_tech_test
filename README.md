[![Build Status](https://travis-ci.org/andygout/till_tech_test.png)](https://travis-ci.org/andygout/till_tech_test)


Till tech test
==============


Brief
-------

Implement a coffe shop till system that contains the business logic to produce receipts similar to the below sample, based on a `json` price list and test orders.

The receipt must:-

- Calculate and show the correct amount of tax (in this shop's case, 8.64%, which is charged prior to any discounts), as well as correct item totals and total amount.

- Take payment and calculate the correct change.

- Handle discounts: a 5% discount on orders over $50, and a 10% muffin discount.

- Have a user interface that can actually be used as a till.


Sample receipt:
-------

![a receipt](/images/receipt.jpg)


Sample order:
-------

> **Jane**
> 2 x Cafe Latte
> 1 x Blueberry Muffin
> 1 x Choc Mudcake
>
> **John**
> 4 x Americano
> 2 x Tiramisu
> 5 x Blueberry Muffin


User stories:
-------

```
As a coffee shop vendor
I want to be able to tally up the order of a customer
So that I can charge them the correct amount

As a coffee shop customer
I want to be able to review my order
So that I can be assured I have been charged the correct amount

As a pedant
I want to see the amount and total value for each ordered item
So that I can understand how the total amount is comprised

As a skinflint
I want to see the discount (if any) received on my order
So that I can relish the savings

As a customer with an awareness and interest in the economy
I want to see the tax amount of my order on my receipt
So that I can appreciate how much is feeding back in to the budget

As a bargain lover
I want to be able to view details of offers
So that I can be aware of them for future visits

As someone who doesn't trust tradespeople
I want the receipt to display the cash given and change due
So that I can ensure it tallies up with what I've been given

As a freelancer
I want the receipt to display the date and time of the purchase
So that I can claim it on my tax return

As a forgetful type
I want the receipt to display the shop's name and address
So that I can revisit in the future
```


Technologies Used:
-------

- Javascript (language) with jQuery (Javascript library).
- Tested using Jasmine (behavior-driven development framework for testing JavaScript code).


Setup:
-------

- Simple HTTP server using Connect and ServeStatic: `npm install connect serve-static`
- Create server.js file as included.
- Run with Node.js: `node server.js`
- Visit `http://localhost:8080/till/html`


Links:
-------

[Github - Makers Academy: Till Tech Test](https://github.com/makersacademy/till_tech_test)

[Connect](https://www.npmjs.com/package/connect)

[Serve Static](https://github.com/expressjs/serve-static)


Images:
-------

![a till](/images/till.jpg)