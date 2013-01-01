Feature: Class
  In order to check the presence of students, add notes about class and students
  As a user
  I want to add class with date, add notes and check the presence


	Background:
	  Given I am logged in
          And I add subject
	  And I add group
	  And I add group of students

	Scenario: User add class
	  When I add class
	  Then I should see a successful class added message
	  And I see this class on the list

	Scenario: User edit class
	  Given I added class
          When I edit class
	  Then I should see a successful class editet message
	  And I see edit class on the list

	Scenario: User delete class
	  Given I added class
          When I destroy class
	  Then I shouldn't see class on the list and data.


	Scenario: User add note about class
	  Given I added class
	  When I add note and I add mark
	  Then I should see note and mark on the list

	Scenario: User check the presence of students
	  Given I added class
	  When I check the presence
	  Then I should see list of presence.


	Scenario: User add note about student on class
	  Given I added class
          And I choose student
          When I add note about student on class
	  Then I should see this note on students page

	Scenario: User give a mark student on class
	  Given I added class
          And I choose student
          When I give a mark student on class
	  Then I should see mark on student's page

