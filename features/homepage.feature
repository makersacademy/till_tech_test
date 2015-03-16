Feature: Using the till
  As an hipster barista
  I want to use a till
  So I can make receipts to the customers

  Scenario: Seeing the name box
    Given I am on the homepage
    Then I should see "Input your name, hipster!"

  Scenario: Input the name and have access to the till
    Given I am on the homepage
    When I fill in "cashier-name" with "Matteo"
    And I press "ENTER"
    Then I should see the till