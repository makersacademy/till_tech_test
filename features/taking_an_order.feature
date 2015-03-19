Feature: Taking an order
	As a barista
	I want to be able to take a customers order
	So that I can give them what they want

	Scenario: Taking an order (single item)
		Given I am on the homepage
		When I click on "Cafe Latte"
		Then I should see "Cafe Latte" x "1"

	Scenario: Taking an order (multiple items)
		Given I am on the homepage
		When I click on "Cafe Latte" twice
		Then I should see "Cafe Latte" x "2"

	Scenario: Clearing an order
		Given I am on the homepage
		When I click on "Cafe Latte"
		And I click on "Clear Order"
		Then I should not see "Cafe Latte" x "1"

	Scenario: Displaying prices (should only see to two decimal places)
		Given I am on the homepage
		When I click on "Blueberry Muffin" 3 times
		Then I see "Blueberry Muffin x 3 = $12.15"