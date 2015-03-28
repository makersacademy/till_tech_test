Feature: Info
As a customer
I want to see the date
So that I know when the receipt was for

  Scenario: Date
  Given that I visited on the 10th March 2015
  When I look at the receipt
  Then I should see "10.03.15"