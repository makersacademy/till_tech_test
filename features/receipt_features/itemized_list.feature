Feature: Receipt 
  As a customer
  I want to see the receipt of my order 
  So that I can check that I have been fairly charged 

  Scenario: Itemized List 
    Given I am at a cafe 
    And I have ordered "Cafe Latte" at a cost of "4.5"
    And I have ordered "Cafe Latte" at a cost of "4.5"
    Then my receipt should show "Cafe Latte" with a quantity of "2" and a cost of "9.0" 

  Scenario: Receipt Footer
    Given I am at a cafe with a sales tax of "0.04"
    And I have ordered "Spaghetti" at a cost of "5.0"
    And I have ordered "Wine" at a cost of "3.0"
    Then my receipt should show a total of "8.32"
    
   



