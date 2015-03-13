Feature: Set up of the till
  As a coffee shop employee
  I want to have a simple interface
  So I can focus on the customer

  Scenario: Coffee Shop Name
  Given I am on the homepage
  Then I should see "Welcome to The Coffee Connection"

  Scenario: Ready to take an order
  Given I am on the homepage
  Then I should see "Ready to take the next order"
