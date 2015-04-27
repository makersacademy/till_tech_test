Feature: Taking payment
  As a coffee shop employee
  I want to take payment from the customer
  So I can be paid by the coffee shop

  Scenario: Seeing button to take payment
  Given I have added Jane's order
  And I click "Print Receipt"
  Then I should see "Money Tendered"

  Scenario: Submitting payment
  Given I have added Jane's order
  And I click "Print Receipt"
  And I fill in "money_tendered" with "25"
  And I click "Submit Payment"
  Then I should see "Change - 3.77"
