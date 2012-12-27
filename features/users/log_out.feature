Feature: Sign out
  In order too protect my account from unauthorized access
  As a user
  I want to be able to log out

    Background:
    	Given I signed up

    Scenario: User logs out
    	Given I am log in
      	When I log out
      	Then I should see a signed out message
      	When I return to the site
      	Then I should be logged out
