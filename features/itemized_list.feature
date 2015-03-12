Feature: Itemized List 
  As a customer
  I want to see an itemized list of what I ordered 
  So that I can check that I have been fairly charged 

  Scenario: A single order 
    Given I order "Cafe Latte"
    And I order "Cafe Latte"
    Then my receipt shows an itemized list of my order 

