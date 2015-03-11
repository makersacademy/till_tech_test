Feature: Shopper can add an item to their Hipster List
  As a hipster at the coffee shop
  I want to add an item to my hipster list
  So that I can remember to buy that item at the hipster coffee shop

  Scenario: Item added to hipster list
    Given I have an empty hipster list
    When I add an item to the list
    Then The hipster list contains a single item

  Scenario: Second item added to hipster list
    Given I have an empty hipster list
    When I add an item to the list
    When I add an item to the list
    Then The hipster list contains two items

  Scenario: Item accessible from hipster list
    Given I have an empty hipster list
    When I add an item to the list
    Then I can access that item from the hipster list

    