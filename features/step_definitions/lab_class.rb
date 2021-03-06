Given /^I added group and students$/ do
  @subject=FactoryGirl.create(:subject, user: @user)
  @group=FactoryGirl.create(:group, subject: @subject)
  @students= Array.new
  20.times do |n|
    @students[n]=FactoryGirl.create(:student, name: Faker::Name.first_name, surname: Faker::Name.last_name, group: @group)
  end
end

When /^I add class$/ do

  visit groups_path
  click_link 'Classes'
  click_link 'New Lab class'
  fill_in "lab_class_subject", with: "First lesson"
  #fill_in "lab_class_date"
  fill_in "lab_class_note", with: "Some note about lab class"
  click_button "Create Lab class"
end

Then /^I should see a successful class added message$/ do
  page.should have_content "Lab class was successfully created."
end

Then /^I see this class on the list$/ do
  visit groups_path
  click_link 'Classes'
  page.should have_content "First lesson"
  page.should have_content "Some note about lab class"
end

Given /^I added class$/ do
  @labclass = FactoryGirl.create(:lab_class, group: @group)
end

When /^I edit class$/ do
  visit groups_path
  click_link 'Classes'
  click_link 'Edit'
  fill_in "lab_class_subject", with: "First lesson Update"
  #fill_in "lab_class_date"
  fill_in "lab_class_note", with: "Some note about lab class, perfect lesson"
  click_button "Update Lab class"
end

Then /^I should see a successful class editet message$/ do
  page.should have_content "Lab class was successfully updated."
end

Then /^I see edit class on the list$/ do
  visit groups_path
  click_link 'Classes'
  page.should have_content "First lesson Update"
  page.should have_content "Some note about lab class, perfect lesson"
end

When /^I destroy class$/ do
  visit groups_path
  click_link 'Classes'
  click_link 'Destroy'
end

Then /^I shouldn't see class on the list and data\.$/ do
  page.should_not have_content @labclass.subject
  page.should_not have_content @labclass.note
end


Given /^I added a few classes$/ do
  @labclasses= Array.new
  5.times do |n|
    @labclasses[n] = FactoryGirl.create(:lab_class, subject: "Lesson number #{n}", group: @group)
  end
end



