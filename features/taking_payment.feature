Feature: Taking Payment
	As a barista
	I want to take payment from the customer
	So that my cafe can make money and I can be paid

	Scenario: Accepting Money and Calculating Change (Correct Amount)
		Given I am on order page and I have ordered a Cafe Latte
		When I input "5.16" cash
		And I click "Open Till"
		Then I see "Change: $0"

	Scenario: Accepting Money and Calculating Change (Too much)
		Given I am on order page and I have ordered a Cafe Latte
		When I input "5.50" cash
		And I click "Open Till"
		Then I see "Change: $0.34"

	Scenario: Customer pays too little
		Given I am on order page and I have ordered a Cafe Latte
		When I input "5.00" cash
		And I click "Open Till"
		Then I see "Customer still owes $0.16, go back"

	Scenario: Customer can see breakdown
		Given I am on order page and I have ordered a Cafe Latte
		When I input "5.50" cash
		And I click "Open Till"
		Then I see "Cash: $5.5"