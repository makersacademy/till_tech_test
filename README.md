Till tech test
==============

*Status*

I've completed stage 1 but the codebase needs significant refactoring. I'd like to have proper separation of concerns, separating the receipt, tax and total attributes into their own classes. The unit tests could also be more thorough and I plan to address these before moving on to V2.

*Instructions*: 

This till app is to be used locally in the Interactive Ruby environment (IRB) and assumes you have Ruby installed.

If that's not the case please follow [this](https://rvm.io/rubies/installing)tutorial to get up and running.

> Please fork and clone this repo locally.

> Run ```bundle``` to install gem dependencies

> Run ```irb```

You can now play with the app using the following:

> ```till = Till.new``` (creates new instance of the till Class)

> ```till.menu``` (shows what's available on the menu)

> ```till.place_order()``` (pass in the string of the customer's food/drink choice, repeat for each item)

>```till.checkout```(when the customer has finished ordering, checkout)

>```till.totals``` (this will calculate the total bill including tax)

>```till.print_receipt``` (this will provide a basic receipt showing the items ordered, at what price, and the total bill with included tax)

Brief
=====

![a till](/images/till.jpg)

We want to sell tills to local hipster coffee shop who are finally embracing the 21st century. We need a new till to replace their vintage machines - unfortunately, hipster staff are too cool to learn a new system, so we need you to build something that they will understand.

To Do:
===
Version 2
---------

- Add functionality to take payment and calculate correct change.  
- Add functionality to handle discounts - in this example, a 5% discount on orders over $50, and a 10% muffin discount.

Version 3
---------

Implement an user interface that can actually be used as a till.
