Feature: Calculate Tax
As a barrista
I want to calculate tax
So that I can add this to the total

  Scenario: Tax
  Given I have ordered "2" "Cappucinos" and "1" "Blueberry Muffin"
  When I look at the receipt
  Then I should see "Tax: 1.02"