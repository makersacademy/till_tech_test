Feature: Receipt 
  As a customer
  I want to see the receipt of my order 
  So that I can check that I have been fairly charged 

  Scenario: A single order 
    Given I am at a cafe 
    And I have ordered "Cafe Latte"
    And I have ordered "Cafe Latte"
    Then my receipt shows an itemized list of my order 

  Scenario: Multiple orders 
    Given I am at a cafe
    And I have ordered "Spaghetti"
    And I have ordered "Wine"
    Then my receipt should show me the total 
    
   



