@javascript 
Feature: Receipt UI

  Scenario: Placing an Order
    Given I am on the homepage
    And I choose an item from the menu
    Then it should appear in the OrderList 

