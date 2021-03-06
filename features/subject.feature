Feature: Subject
  In order to organize work
  As a user
  I want to add, edit, delete my subjects

  Background:
    Given I am logged in

  Scenario: User add subject
    When I add subject
    Then I should see a successful subject added message
    And I see this subject on the list

  Scenario: User add subject without name
    When I try add subject without name
    Then I should see message that name can't be blank

  Scenario: User edit subject
    When I edit subject
    Then I should see a successful subject edited message
    And I see edited subject on the list

  Scenario: User delete subject
    When I delete subject
    Then I should see a successful subject deleted message
    And I shouldn't see groups who belongs to this subject
