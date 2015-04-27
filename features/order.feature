Feature: Taking an order
  As a coffee shop employee
  I want to be able to take orders
  So I can fulfill the customer's needs

  Scenario: Taking an order
  Given I am on the homepage
  And I select "Cafe Latte" from "menu-dropdown"
  And I fill in "quantity" with "2"
  And I click "Submit Order Item"
  Then I should see "Cafe Latte x 2"

  Scenario: Adding another item to the order
  Given I have added one item already
  And I select "Blueberry Muffin" from "menu-dropdown"
  And I fill in "quantity" with "1"
  And I click "Submit Order Item"
  Then I should see "Blueberry Muffin x 1"
