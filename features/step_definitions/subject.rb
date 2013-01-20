def add_subject(name)
  visit subjects_path
  click_link "New Subject"
  fill_in "subject_subject", with: name
  click_button "Create Subject"
end

When /^I add subject$/ do
  add_subject("Science")
end

Then /^I should see a successful subject added message$/ do
  page.should have_content "Subject was successfully created."
end

Then /^I see this subject on the list$/ do
  visit subjects_path
  page.should have_content "Science"
end

When /^I try add subject without name$/ do
  visit subjects_path
  click_link "New Subject"
  fill_in "subject_subject", with: "    "
  click_button "Create Subject"
end

Then /^I should see message that name can't be blank$/ do
  page.should have_content "Subject can't be blank"
end

When /^I edit subject$/ do
  @subject=FactoryGirl.create(:subject, user: @user)
  visit subjects_path
  click_link "Edit"
  fill_in "subject_subject", with: "New Science"
  click_button "Update Subject"
end

Then /^I should see a successful subject edited message$/ do
  page.should have_content "Subject was successfully updated."
end

Then /^I see edited subject on the list$/ do
  visit subjects_path
  page.should have_content "New Science"
end

When /^I delete subject$/ do
  @subject=FactoryGirl.create(:subject, user: @user)
  @group=FactoryGirl.create(:group, subject: @subject)
  visit subjects_path
  page.should have_content @group.subject.subject

  visit groups_path
  page.should have_content @group.group
  visit subjects_path
  click_link "Destroy"
end

Then /^I should see a successful subject deleted message$/ do
  page.should have_content "Subject was successfully destroyed."
  page.should_not have_content @group.subject.subject
end

Then /^I shouldn't see groups who belongs to this subject$/ do
  visit groups_path
  page.should_not have_content @group.group
end

Given /^I added subject$/ do
  @subject=FactoryGirl.create(:subject, user: @user)
end
