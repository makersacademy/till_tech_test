Feature: Ready to accept an order
  In order to take customers orders
  As a coffee shop staff member
  I want the till to be ready to take an order

  Scenario:
    Given I am ready to take an order
    Then the screen should contain "Welcome to Hipster Coffee Shop"

  Scenario:
    Given I am ready to take an order
    Then the screen should contain "Ready to take an order"

  Scenario:
    Given a customer has made their order
    And I am ready to take the next customers order
    Then the order should be empty
