Feature: Gruop
  In order to easily manage groups
  As a user
  I want to add, edit, delete groups


	Background:
	  Given I am logged in

	Scenario: User add group
	  When I add group
	  Then I should see a successful group added message
	  And I see this group on the list
