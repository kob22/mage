Feature: Presences
  In order to check the presence of students
  As a user
  I want to check the presence and see all students on the list

	Background:
	  Given I am logged in
          And I added group and students

	Scenario: User check the presence of students
	  Given I added class
	  When I check the presence
	  Then I should see list of presence.

	Scenario: User see list of presences
	  Given I added a few classes
	  When I checked the presences
          Then I should see all presences on the presences group list
	  


