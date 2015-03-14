Feature: Finalizing an order
	As a barista
	I want to be able to finalize a customers order
	So that they can know how much to pay

	Scenario: Confirming an order (before selecting anything)
		Given I am on the homepage
		Then I should not be able to see "Confirm Order"

	Scenario: Confirming order complete (show confirmed total)
		Given I am on the homepage
		When I click on "Cafe Latte"
		And I click on "Confirm Order"
		Then I should see Total = "$5.16"

	Scenario: Confirming order complete (show input for money recieved)
		Given I am on the homepage
		When I click on "Cafe Latte"
		And I click on "Confirm Order"
		Then I should see an input field