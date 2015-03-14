Feature: Receipt 
  As a customer
  I want to be given a receipt 
  So that I can check that I have been fairly charged 

  Scenario: Itemized List 
    Given I have ordered "Cafe Latte"
    And I order "Cafe Latte"
    Then my receipt shows an itemized list of my order 

  Scenario: Subtotal
    Given I have ordered "Cafe Latte" at a cost of "3.0"
    And I order "Spaghetti" at a cost of "5.0"
    Then my receipt shows a subtotal of "8.0"

  Scenario: Tax
    Given I am at a cafe with a sales tax of "5%"
    Given I have ordered "Cafe Latte" as a cost of "3.0"
    Then my receipt shows a tax of "0.15"

  Scenario: Discount on Item
    Given I have ordered a discounted "Muffin" 
    Then my receipt shows a discounted cost

  Scenario: Discount on Overall Price
    Given I am at a cafe with a discount on orders over "50.0"
    And I have spent over "50.0" 
    Then my receipt shows a discounted grand total
    
