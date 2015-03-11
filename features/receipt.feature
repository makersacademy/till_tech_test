Feature: Receipt 
  As a customer
  I want to see the receipt of my order 
  So that I can check that I have been fairly charged 

  Scenario: A single order 
    Given I am at a cafe 
    And I order "Cafe Latte"
    And I order "Cafe Latte"
    Then my receipt shows an itemized list of my order 

  Scenario: Multiple orders 
    Given I am at a cafe
    And I order "Spaghetti"
    And I order "Wine"
    Then my receipt should show me the total 

