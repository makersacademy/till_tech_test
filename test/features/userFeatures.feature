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

Feature: Shopper can delete an item
    As a hipster at the coffee shop
    I want to delete an item to my hipster list
    So that I don't have to buy it


  Scenario: Second item added to hipster list
    Given I have an empty hipster list
    When I add an item to the list
    When I delete an item from the list
    Then I do not see the item in my list
