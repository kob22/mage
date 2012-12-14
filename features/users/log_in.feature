Feature: Log in
  In order to get access to the site
  As a user
  I want to be able to log in

 	Background:
      		Given I signed up
		And I am not logged


	    Scenario: User signs in successfully
	      When I sign in with valid credentials
	      Then I should see a successful sign in message
	      When I return to the site
	      Then I should be signed in

	    Scenario: User signs with wrong email
	      When I sign in with wrong email
	      Then I see an invalid login message
	      And I should be signed out

	    Scenario: User signs with wrong password
	      When I sign in with wrong password
	      Then I see an invalid login message
	      And I should be signed out