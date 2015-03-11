Feature: Shopper knows how much item costs
  As a hipster at the coffee shop
  I want to know how much an item costs
  So that I have enough money to pay for it

  Scenario: item prices added to get total
    Given I have an empty hipster list
    When I add an item to the list
    When I add an item to the list
    Then I can pay for the total