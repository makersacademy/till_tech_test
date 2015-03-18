@javascript
Feature: Receipt UI

  Scenario: Placing an Order
    Given I am on the homepage
    And I choose an item from the menu
    Then it should appear in the OrderList 

  Scenario: Viewing Orders
    Given I have made a few orders
    And I am on the homepage 
    Then I should see my orders on my receipt

  Scenario: Placing & Viewing Orders
    Given I am on the homepage
    And I choose an item from the menu
    Then I should see my order on my receipt

  Scenario: Making Payments
    Given I am on the homepage
    And I have made a few orders 
    When I enter a payment
    Then I should see the payment on my receipt

