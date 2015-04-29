Till Tech Test
==============

Makers Academy 12th week exercise to implement a system that contains the business logic to produce receipts, based on a json price list and test orders. The receipt must calculate and show the correct amount of tax (in this shop's case, 8.64%), as well as correct line totals and total amount.

Set Up
-------
####Command Line:
```$ git clone https://github.com/sphaughton/till_tech_test.git```
```$ cd till_tech_test```

Technologies Used
-------
- Ruby 2.2.0
- Rspec 3.2.0

Logic
-------
The Till class performs all calculations and reads the price list. Several methods will need to be extracted into individual classes upon completion of Version 1's basic functionality. Order class will be created to hold the items array, and Menu class will be created to hold the price list. The Receipt class will hold items making up a receipt.

To Do
-------
- [ ] Version 1: Print receipt
- [ ] Refactor
- [ ] Version 2: Correct change
- [ ] Version 2: Discounts - in this example, a 5% discount on orders over £50, and a 10% muffin discount
- [ ] Version 3: User interface
- [ ] Travis CI
- [ ] Code Climate coverage

