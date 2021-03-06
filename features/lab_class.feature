Feature: Class
  In order to know when and what were about on classes
  As a user
  I want to manage classes

  Background:
    Given I am logged in
    And I added group and students

  Scenario: User add class
    When I add class
    Then I should see a successful class added message
    And I see this class on the list

  Scenario: User edit class
    Given I added class
    When I edit class
    Then I should see a successful class editet message
    And I see edit class on the list

  Scenario: User delete class
    Given I added class
    When I destroy class
    Then I shouldn't see class on the list and data.




