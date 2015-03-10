Feature: Order taking
  In order to ensure customers get their choices
  As a coffee shop staff member
  I want to record the customers order

  Scenario:
    Given the customer wants a new order
    And I enter quantity 1 of "Cafe Latte" into the order
    Then the order should contain 1 "Cafe Latte"
