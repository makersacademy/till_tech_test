Feature: Menu
  As a hungry diner
  I want to order from the menu
  So I can eat something to my taste

  Scenario: Choosing
    Given I have ordered something on the menu
    Then my order should be placed
