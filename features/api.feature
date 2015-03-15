Feature: API

  Scenario: Returns menu as JSON
    Given I have made a GET request to "/api/location/thecafe/menu/1" 
    And I receive the status "200"
    Then I should receive a JSON with a menu

  Scenario: Adding an order to an OrderList
    Given I have made a PUT request with my order to "api/orderlist/1"
    Then I receive the status "200" 
    
    
