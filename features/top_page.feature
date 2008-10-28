Feature: Top page
 
  Scenario: GET platonic URI
    Given I have set http://pinto.jp/ as a target URI
    Given I have set no If-Modified-Since header
    And I have set no If-None-Match header
    And I have set no If-Unmodified-Since header
    And I have set no If-Match header
    When I GET
    Then the response status code should be 300

  More Examples:
    | URI              | If-Modified-Since | If-None-Match | If-Unmodified-Since | If-Match | status code |
    | http://pinto.jp/ | unmodified        | no            | no                  | no       | 304         |
    | http://pinto.jp/ | no                | unmodified    | no                  | no       | 304         |
    | http://pinto.jp/ | unmodified        | unmodified    | no                  | no       | 304         |
    | http://pinto.jp/ | modified          | no            | no                  | no       | 300         |
    | http://pinto.jp/ | no                | modified      | no                  | no       | 300         |
    | http://pinto.jp/ | modified          | unmodified    | no                  | no       | 300         |
    | http://pinto.jp/ | unmodified        | modified      | no                  | no       | 300         |
    | http://pinto.jp/ | modified          | modified      | no                  | no       | 300         |


