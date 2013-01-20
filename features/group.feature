Feature: Group
  In order to know when and with which group I have classes
  As a user
  I want to manage groups

  Background:
    Given I am logged in
    And I added subject

  Scenario: User add group
    When I add group
    Then I should see a successful group added message
    And I see this group on the list

  Scenario: User add group without data
    When I add group without data
    Then I should see a error message, that fields can't be blank

  Scenario: User edit group
    When I edit group
    Then I should see a successful group edited message
    And I should see this edited group with valid data on the list

  Scenario: User delete group
    When I delete group
    Then I should see a successful group deleted message
    And I shouldn't see students who belongs to this group
