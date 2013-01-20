Feature: Students
  In order to know who students should attend classes
  As a user
  I want to manage students in groups

  Background:
    Given I am logged in
    And I added group

  Scenario: User add students
    When I add group of students
    Then I should see how many students was add
    And I see this students on the list

  Scenario: User edit student
    When I edit student
    Then I should see edited student on the list

  Scenario: User destroy student
    When I destroy students
    Then I shouldn't see this student on the list
