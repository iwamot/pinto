Feature: Top page
 
  Scenario: GET platonic URI
    When I GET http://pinto.jp/
    Then the response status code should be 300

