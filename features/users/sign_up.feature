Feature: Sign up
  In order to get access to the site
  As a user
  I want to be able to sign up

 	Background:
      		Given I am not logged in

	Scenario: User signs up with valid data
		When I sign up with valid user data
		Then I should see a successful sign up message

	Scenario: User signs up with no data
		When I sign up with no data
		Then I should see an error message

	Scenario: User signs up with invalid email
		When I sign up with an invalid email
		Then I should see an invalid email message

	Scenario: User signs up with too short password
		When I sign up with too short password
		Then I should see too short password message

	Scenario: User signs up with mismatched password and confirmation
		When I sign up with mismatched password and confirmation
		Then I should see mismatched password message


