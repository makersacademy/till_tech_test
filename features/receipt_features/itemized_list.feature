Feature: Itemized List 
  As a customer
  I want an itemized list of charges 
  So that I can check that I have been fairly charged 

  Scenario: Quantities 
    Given I am at "The Coffee Connection"
    And I have ordered "2" "Cafe Latte" 
    Then I should have "Cafe Latte 2 x" on my receipt



