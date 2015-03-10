Feature: Itemized List 
  As a customer
  I want an itemized list of charges 
  So that I can check that I have been fairly charged 

  Scenario: Quantities 
    Given I am at the till
    And I have ordered two Lattes
    And I request the bill
    Then I should have "Cafe Latte 2x" on my bill



