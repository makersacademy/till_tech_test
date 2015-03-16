@javascript 
Feature: Receipt

  Scenario: Placing an Order
    Given I am on the homepage
    And I choose an item from the menu
    Then I should see it appear on my receipt

