Feature: Order taking
  In order to ensure customers get their choices
  As a coffee shop staff member
  I want to record the customers order

  Scenario:
    Given the customer wants a new order
    And I enter quantity 1 of "Cafe Latte" into the order
    Then the order should contain 1 "Cafe Latte"

  Scenario:
    Given the customer wants a new order
    And I enter quantity 2 of "Cafe Latte" into the order
    And I enter quantity 3 of "Cortado" into the order
    Then the order should contain both 2 "Cafe Latte" and 3 "Cortado"

  Scenario:
    Given a customer has made their order
    And I am ready to take the next customers order
    Then the order should be empty
