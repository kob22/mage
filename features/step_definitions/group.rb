def add_group(group_name, group_day, group_week, group_time)
  visit subjects_path
  click_link "Groups"
  click_link "New"
  fill_in "group_group", with: group_name
  fill_in "group_day", with: group_day
  fill_in "group_week", with: group_week
  # select default time
  click_button "Create Group"

end


When /^I add group$/ do

  add_group("First","Friday","AB","17:00")

end

Then /^I should see a successful group added message$/ do
  page.should have_content "Group was successfully created."
end

Then /^I see this group on the list$/ do
  visit groups_path
  page.should have_content "First"
end



When /^I add group without data$/ do

  add_group("","","","")

end

When /^I should see a error message, that fileds can't be blank$/ do
  
  page.should have_content "Group can't be blank"
  page.should have_content "Day can't be blank"
  page.should have_content "Week can't be blank"
#  page.should have_content "Time can't be blank"

end


When /^I edit group$/ do

  @group=FactoryGirl.create(:group, subject: @subject)
  visit subjects_path
  click_link "Groups"
  click_link "Edit"
  fill_in "group_group", with: "Second"
  fill_in "group_day", with: "Monday"
  fill_in "group_week", with: "B"
  # select default time
  click_button "Update Group"


end


Then /^I should see a successful group edited message$/ do
  page.should have_content "Group was successfully updated."
end


Then /^I should see this edited group with valid data on the list$/ do
  visit subjects_path
  click_link "Groups"
  page.should have_content "Second"
  click_link "Show"
  page.should have_content 'Group name'
  page.should have_content 'Second'
  page.should have_content 'Day'
  page.should have_content 'Monday'
  page.should have_content 'Week'
  page.should have_content 'B'
#  page.should have_content "Time: B"

end

When /^I delete group$/ do
  @group=FactoryGirl.create(:group)
  @students = FactoryGirl.create_list(:student, 10, group: @group)
  visit groups_path
  page.should have_content @group.group
  click_link "Students"
  @students.each do |student|
  
  page.should have_content student.name
  page.should have_content student.surname
  end
  visit groups_path
  click_link "Destroy"
end

Then /^I should see a successful group deleted message$/ do
  page.should have_content "Group was successfully destroyed."
  page.should_not have_content @group.group
end

Then /^I shouldn't see students who belongs to this group$/ do
  visit groups_path
  page.should_not have_content @group.group
  visit students_path
  @students.each do |student|
  
  page.should_not have_content student.name
  page.should_not have_content student.surname
  end
end

Given /^I added group$/ do
  @group=FactoryGirl.create(:group)
end



