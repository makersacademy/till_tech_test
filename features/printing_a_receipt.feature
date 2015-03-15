Feature: Printing a receipt
	As a Barista
	I want to print a receipt
	So that the customer might know the breakdown of what they have spent

	Scenario: The customer orders a few items (no muffins)
		Given I am on the order page and I have ordered a "Cafe Latte" and a "Tea"
		When I input some cash
		And I click "Open Till"
		Then I see "Cafe Latte 1 x $4.75 Tea 1 x $3.65"

	Scenario: The customer orders a few items (with muffins)
		Given I am on the order page and I have ordered a "Cafe Latte" and a "Blueberry Muffin"
		When I input some cash
		And I click "Open Till"
		Then I see Muffin Discount 10% from $4.05