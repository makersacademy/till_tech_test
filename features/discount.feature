Feature: Discount
  Given I am am a cafe owner
  I want to give a discount on purchases over 50$
  In order to incentivize customers to spend more

  Scenario: A customer spends over 50$
    Given I am at a cafe
    And I order "Lobster Banquet" at a cost of "60.0"
    Then my receipt shows a discounted total

  Scenario: A customer orders a discounted muffin
    Given I am at a cafe
    And I order a "5%" discounted "Muffin" at a cost of "5.0"
    Then my receipt shows the discounted muffin price
