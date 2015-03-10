Feature: Creating a reciept
	As a barista
	I want to see a breakdown of what the customer has ordered
	So that they can check the total is correct and know how much to pay

	Scenario: Buying a coffee(normal customer)
		Given a product named Cafe Latte and costing $4.60 is on the menu
		When I enter this with a quantity of 1 on the till
		Then the order subtotal price (pre-VAT) should be $4.60
	
	Scenario: Buying a coffee(normal customer)
		Given a product named Cafe Latte and costing $4.60 is on the menu
		When I enter this with a quantity of 1 on the till
		Then the order total price (inc. VAT) should include tax of 8.64% ($5.00)

	Scenario: Buying a coffee(VAT registered customer)
		Given I am a VAT registered customer
		When I get my reciept
		Then the receipt should include the time and date

	