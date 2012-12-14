Feature: Sign out
  In order too protect my account from unauthorized access
  As a user
  I want to be able to log out

    Scenario: User signs out
      Given I am logged in
      When I sign out
      Then I should see a signed out message
      When I return to the site
      Then I should be signed out
