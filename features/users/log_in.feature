Feature: Log in
  In order to get safely access to the site
  As a user
  I want to be able to log in

  Background:
    Given I signed up
    And I am not logged

  Scenario: User logs in successfully
    When I log in with valid credentials
    Then I should see a successful log in message
    When I return to the site
    Then I should be logged in

  Scenario: User logs in with wrong email
    When I log in with wrong email
    Then I see an invalid log in message
    And I should be logged out

  Scenario: User logs in with wrong password
    When I log in with wrong password
    Then I see an invalid log in message
    And I should be logged out

  Scenario: User logs in successfully with check remember me
    When I log in with valid credentials and check box remember me
    Then I should see a successful log in message
    When I close the browser
    Then I return to the site
    And I should be still log in

  Scenario: User logs in successfully with uncheck remember me
    When I log in with valid credentials and uncheck box remember me
    Then I should see a successful log in message
    When I close the browser
    Then I return to the site
    And I should see log in page

  Scenario: User resets password
    When I request an email with password reset
    Then I receive an email with password reset link
    And I choose new password
    When I should log in with new password
    Then I should see a successful log in message
