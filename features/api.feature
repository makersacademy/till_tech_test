Feature: API

  Scenario: Returns menu as JSON
    Given I have made a GET request to "api/menu/thecafe" 
    And I receive the status "200"
    Then I should receive a JSON with a menu
    
