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

	    Scenario: User signs in successfully with check remember me
	      When I sign in with valid credentials and check box remember me
	      Then I should see a successful sign in message
	      When I close the browser
	      Then I return to the site
	      And I should be still log in


	    Scenario: User signs in successfully with uncheck remember me
	      When I sign in with valid credentials and uncheck box remember me
	      Then I should see a successful sign in message
	      When I close the browser
	      Then I return to the site
	      And I should see log in page


	    Scenario: User reset password
	      When I request an email with password reset
	      Then I receive an email with password reset link
              And I choose new password
	      When I should sign in with new password
	      Then I should see a successful sign in message
