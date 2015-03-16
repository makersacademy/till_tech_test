Feature: Adding items to an order
  As a coffee shop assistant
  I want to add items to a customers order
  So that I know what to charge them

  Scenario: Adding an item
    Given I am on the homepage
    And I select "Cappucino" from "item"
    And I select "1" from "quantity"
    And I press "Add to order"
    Then I should see "Cappucino 1x 3.85"

  Scenario: Clearing the till
    Given I am on the homepage
    And I select "Cappucino" from "item"
    And I select "1" from "quantity"
    And I press "Add to order"
    And I follow "Clear order"
    Then I should not see "Cappucino 1x 3.85"