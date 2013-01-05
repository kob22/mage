def add_students
  visit subjects_path
  click_link "Groups"
  click_link "Students"
  click_link "New Student"
  fill_in "list_of_student", with: "First Student\r\n\r\nSecond Student\r\n\r\nThird Student"
  click_button "Add students"
end

When /^I add group of students$/ do
  add_students
end

Then /^I should see how many students was add$/ do
  page.should have_content("Added 3 students")
end

Then /^I see this students on the list$/ do
  page.should have_content("First Student")
  page.should have_content("Second Student")
  page.should have_content("Third Student")
end

Then /^I edit student$/ do

  @students = FactoryGirl.create_list(:student, 1, group: @group)
  visit students_path
  click_link "Edit"
  fill_in "student_name", with: "fourth student"
  click_button "Update Student"
end

Then /^I should see edited student on the list$/ do
  page.should have_content("fourth student")
end

When /^I destroy students$/ do
  @students = FactoryGirl.create_list(:student, 1, group: @group)
  visit students_path
  click_link "Destroy"
  page.should have_content "Student was successfully destroyed."
end

Then /^I shouldn't see this student on the list$/ do
  @students.each do |student|

    page.should_not have_content student.name
    page.should_not have_content student.surname
  end
end
