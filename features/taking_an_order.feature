Feature: Taking an order
	As a barista
	I want to be able to take a customers order
	So that I can give them what they want

	Scenario: Taking an order (single item)
		Given I am on the homepage
		When I click on "Cafe Latte"
		Then I should see "Cafe Latte x 1"

		