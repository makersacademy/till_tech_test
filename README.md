Till tech test
==============

Specification
=================

We want to sell tills to a local hipster coffee shop who are finally embracing the 21st century. We need a new till to replace their vintage machines - unfortunately, hipster staff are too cool to learn a new system, so we need you to build something that they will understand.

Version 1
---------

Implement a system that contains the business logic to produce receipts similar to this, based on a `json` price list and test orders. A sample `.json` file has been provided with the list of products sold at this particular coffee shop.
Your receipt must calculate and show the correct amount of tax (in this shop's case, 8.64%), as well as correct line totals and total amount. Do not worry about calculating discounts or change yet. Consider what output formats may be suitable.

Version 2
---------

- Add functionality to take payment and calculate correct change.
- Add functionality to handle discounts - in this example, a 5% discount on orders over $50, and a 10% muffin discount.

Version 3
---------

Implement an user interface that can actually be used as a till.


Summary - My Submission
=================

* I chose to develop a mobile-app interface (HipTillio) for the new till system given the user preferences of hipster baristas

* I built the app using Ionic and Angular JS to enable cross operation system coverage (IOS and Android), quick prototype development and robust feature testing through Protractor

* I followed Agile and TDD methodologies - created user stories across the 3 versions and created a waffle.io board to manage tickets

* To view locally, ensure you have node js installed and install the relevant npm packages including Ionic globally. It can also be viewed on your mobile device by downloading Ionic View and loading the app ID (refer to detailed instructions below)

* Challenges and proposed improvements - the primary design challenges revolved around managing the implications of asynchronicity across my testing suite and when trying to refactor my controller methods. Additionaly, due to challenges in accessing the data on an external IOS device through Ionic View, I decided to host the menu data within a local controller variable vs an external API or file endpoint retrieved through an Angular factory method.

![Mobile App Pre Order](https://github.com/AlexHandy1/till_tech_test/blob/master/images/HipTillio-preorder.png)
![Mobile App Receipt](https://github.com/AlexHandy1/till_tech_test/blob/master/images/HipTillio-receipt.png)
[Waffle](https://waffle.io/AlexHandy1/till_tech_test)

Use Cases:
-------

```
- [x] As a barista,
      So that I can begin to calculate the total cost,
      I want a list of all order items with quantities and their prices taken from the menu

- [x] As a barista,
      So that I can complete the calculation of the total cost of food,
      I want to sum all the order items and quantities shown in the list and display the total without tax at the end of receipt

- [x] As a barista,
      So that I can see the total cost after tax,
      I want to calculate and display the monetary value of a 8.64% tax rate on the order

- [x] As a barista,
      So that I quickly give the correct change owed to customer,
      I want to calculate and display the monetary difference between total cost after tax and amount of payment provided by the customer

- [x] As a barista,
      So that I can offer discounts to customers,
      I want to calculate and display the discount on a given order and subtract it from total

- [x] As a barista,
      So that I can manage my shop on the go,
      I want a mobile interface that lets me generate temporary receipts for individual orders

```

How to run
----

### Local Installation

After you have downloaded or locally installed Node.js, to view in local web browser (localhost 8100) and run tests follow the below commands in the command-line

```
git clone https://github.com/AlexHandy1/till_tech_test
cd till_tech_test/till_tech
npm install -g cordova ionic
npm install
ionic serve --lab
webdriver-manager start (in new command-line tab)
protractor test/e2e/conf.js (in new command-line tab)
```

### Run on Mobile

* Download the Ionic View App
* Sign-up for an Ionic View Account
* In your Ionic View App Settings (Button Top Left) enter the App ID - 0CB982F3 and click on Load App


Technologies used
----

* Production - Ionic (IOS and Android), Cordova, Angular JS, Javascript, Bower, Node, HTML
* Testing - Protractor, Selenium

Further Improvements
----

*  Further explore how can host menu data outside of an Angular controller in API or file whilst maintaining full functionality on a local Ionic View IOS app

*  Implement improved asychronicity management in Protractor tests to write broader suite of tests for multiple items in one order and to test validation alerts

*  Further refactor controller methods whilst maintaining necessary sequential commands in asynchronous environment

