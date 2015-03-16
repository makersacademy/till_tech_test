@api, @domain
Feature: API

  Scenario: Returns menu as JSON
    Given I have made a GET request to "/api/location/thecafe/menu/1" 
    And I receive the status "200"
    Then I should receive a JSON with a menu

  Scenario: Adding an order to an OrderList
    Given I have made a POST request with my order to "api/order/1"
    Then I receive the status "200" 

  Scenario: Retrieving a receipt
    Given I have made POST requests for a few orders
    And I make a GET request to "/api/order/1"
    Then I should receive a JSON receipt
    
    
