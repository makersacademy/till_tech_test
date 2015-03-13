Feature: Printing a receipt
  As a coffee shop employee
  I want to print a receipt
  So I can bill the customer for their order

  Scenario:
  Given I have added Jane's order
  And I click "Print Receipt"
  Then I should see Jane's receipt
