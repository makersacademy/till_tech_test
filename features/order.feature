Feature: Taking an order
  As a coffee shop employee
  I want to be able to take orders
  So I can fulfill the customer's needs

  Scenario: Taking an order
  Given I am on the homepage
  And I select "Cafe Latte"
  And I fill in "Quantity" with "2"
  And I click "Submit Order Item"
  Then I should see "Cafe Latte x 2"
