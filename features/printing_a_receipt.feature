Feature: Printing a receipt
	As a Barista
	I want to print a receipt
	So that the customer might know the breakdown of what they have spent

	Scenario: The customer orders a few items (no muffins)
		Given I am on the order page and I have ordered a "Cafe Latte" and a "Tea"
		When I input some cash
		And I click "Open Till"
		Then I see "Cafe Latte x 1 = $4.75 Tea x 1 = $3.65"

	Scenario: The customer orders a few items (with muffins)
		Given I am on the order page and I have ordered a "Cafe Latte" and a "Blueberry Muffin"
		When I input some cash
		And I click "Open Till"
		Then I see "Muffin Discount 10% from $4.05"

	Scenario: The customer orders many items to a value over the discount limit
		Given I am on the order page and I have ordered 20 Cafe Latte's
		When I input sufficient cash
		And I click "Open Till"
		Then I see "Discount 5% from $95"

	Scenario: The customer needs to see their tax
		Given I am on the order page and I have ordered a "Cafe Latte" and a "Tea"
		When I input some cash
		And I click "Open Till"
		Then I see "Tax $0.73"

	Scenario: The customer needs to see the cafe details
		Given I am on the order page and I have ordered a "Cafe Latte" and a "Tea"
		When I input some cash
		And I click "Open Till"
		Then I see "The Coffee Connection 123 Lakeside Way 16503600708"

	Scenario: The customer can see the total of the order
		Given I am on the order page and I have ordered a "Cafe Latte" and a "Tea"
		When I input some cash
		And I click "Open Till"
		Then I see "Total $9.13"

	Scenario: The customer can see time and date of transaction for their records
		Given I am on the order page and I have ordered a "Cafe Latte" and a "Tea"
		When I input some cash
		And I click "Open Till"
		Then I see the current time and date