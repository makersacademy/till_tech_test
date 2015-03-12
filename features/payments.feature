Feature: Payments
  As a satisfied customer
  I want to pay for my bill
  So I can leave the restaurant

  Scenario Outline: Paying for my Order 
    Given I am at a cafe with a sales tax of "<tax>"
    And I order "<order>" at a cost of "<cost>" 
    And I pay "<payment>"
    Then my receipt shows I am owed "<change>" 

    Examples:
      |order        |cost   |tax  | payment | change | 
      |Cafe Latte   |4.5    |1%   | 5.0     | 0.46   |
      |Spaghetti    |6      |3.5% | 8.0     | 1.79   |
      |Muffin       |2.3    |4.32%| 22.0    | 19.6   |

   




