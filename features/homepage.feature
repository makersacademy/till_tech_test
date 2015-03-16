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
    Then I should see "Matteo"
    And I should see "1 2 3 4 5 6 7 8 9 0 Cafe Latte Flat White Cappuccino Single Espresso Double Espresso Americano Cortado Tea Choc Mudcake Choc Mousse Affogato Tiramisu Blueberry Muffin Chocolate Chip Muffin Muffin Of The Day"