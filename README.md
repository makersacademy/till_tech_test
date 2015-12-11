Till tech test
==============

*Instructions*: Please fork this repo and submit a pull request once you've finished. Then prepare for code review!

![a till](/images/till.jpg)

We want to sell tills to local hipster coffee shop who are finally embracing the 21st century. We need a new till to replace their vintage machines - unfortunately, hipster staff are too cool to learn a new system, so we need you to build something that they will understand.

Specification
-------------
This is what a sample receipt looks like:

![a receipt](/images/receipt.jpg)

##### Running locally
- clone this repo
- type rspec init
- check test
- type: irb
- type: require'./lib/menu'
- create object: m=Menu.new
- type: m.showmenu[0] you should see :
![a menu-list](/images/menu.png)
- type: m.order("Cafe Latte",5)
- type: m.order("Affogato",5)
- type: m.order("Tea",5)
- type: m.order("Choc Mousse",5)
- or everything what do you want
- type: m.prices
- type: m.sum
- type: m.taxes
- type: m.discount
- type: m.money(200)  or any other sum
- type: m.charge
- type: m.total_bill

###### you should see something like this

![a menu-list](/images/bill.png)
---------
Test checks that:
 - 1. We can see the list of the customer order
 - 2. We can see prices and quantity of products in customer bill
 - 3. We can see the final sum of the bill
 - 4. We can see the tax of the final sum of the bill
 - 5. We can see price with 5% discount in case our purchase is more than 50$
 - 6. We can see the discount separately in our bill
 - 7. We can see the change of the customer
 - 8. We can see the discount to various maffins


 Program has 1 class Menu and methods  
 - `def Initialize` (sets ours vars and grabs data from `json` file)
 - `def order` (compares each customer order with data from `json` file, also adds quantity of each product and checks muffin discount)
 - `def prices` (shows price of each ordered product separately)
 - `def sum` (shows total sum of bill, and makes a discount in case the bill is more than 50$)
 - `def taxes` (shows the taxes)
 - `def discount` (shows amount of discount separately)
 - `def money` (shows amount of money which gives customer)
 - `def charge` (shows the change which gets customer)
