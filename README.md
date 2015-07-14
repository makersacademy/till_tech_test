User Stories (Version 1)
------------

```
	As a coffee selling hipster
	So that my hipster customers will remember where they got this receipt
	I would like my till receipt to show the name of my hipster coffee shop

	As a coffee selling hipster
	So that my hipster customers can see what they've ordered
	I would like my till receipt to show each hipster item they've ordered

	As a coffee selling hipster
	So that my hipster customers can see what they've ordered
	I would like my till receipt to show the price alongside each hipster item they've ordered

	As a coffee selling hipster
	So that I can charge my hipster customers the right amount
	I would like my till receipt to show me the total that my hipster customers owe

	As a coffee selling hipster
	So that I can adhere to the not-quite-hipster law
	I would like my till receipt to have a not-too-hipster 8.64% tax added on
```






Testing
-------

Tested in Jasmine! To run Jasmine tests from the command line, navigate to the folder that the SpecRunner.html is in and run the command "open SpecRunner.html" to run the Jasmine tests.


CURRENTLY WANT TO GET TRAVIS WORKING FOR JAVASCRIPT BUILDS - have bookmarked pages for later









User Stories (Version 2)
------------

```
```













Till tech test
==============

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
- Add functionality to print date and time on receipt

Version 3
---------

Implement an user interface that can actually be used as a till.

You may use whatever technologies you see fit.
