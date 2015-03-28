Feature: Total Cost
As a customer
I want to see the cost of my order
So I know how much to pay

  Scenario: Show Price
  Given I have ordered "1" "Blueberry Muffin"
  When I look at the receipt
  Then I should see "Blueberry Muffin: 4.05"

  Scenario: Show Item Number
  Given I have ordered "2" "Cappucinos"
  When I look at the receipt
  Then I should see "Cappucino 2 x 3.85"

  Scenario: Show Total
  Given I have ordered "2" "Cappucinos" and "1" "Blueberry Muffin"
  When I look at the receipt
  Then I should see "Total: 11.75"
