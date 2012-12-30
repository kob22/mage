

module EmailHelpers
  def current_email_address
    # Replace with your a way to find your current email. e.g @current_user.email
    # last_email_address will return the last email address used by email spec to find an email.
    # Note that last_email_address will be reset after each Scenario.
    last_email_address || "kob2222@gmail.com"
  end
end

World(EmailHelpers)
World(ShowMeTheCookies)



def sign_up
visit '/signup'
click_link 'Sign Up'
fill_in "user_title", :with => @user.title
fill_in "user_name", :with => @user.name
fill_in "user_surname", :with => @user.surname
fill_in "user_email", :with => @user.email
fill_in "user_password", :with => @user.password
fill_in "user_password_confirmation", :with => @user.password_confirmation
click_button "Sign Up"

end


def log_out
visit '/logout'
end


def log_in
visit '/'
click_link 'Log In'
fill_in "email", :with => @user.email
fill_in "password", :with => @user.password
click_button "Log In"
end


Given /^I am not logged in$/ do
  visit '/logout'
end

When /^I sign up with valid user data$/ do
 @user=FactoryGirl.build(:user)
sign_up
end

Then /^I should see a successful sign up message$/ do
  page.should have_content "Thank you for signing up!"
  page.should have_content "Logged in as #{@user.title} #{@user.name} #{@user.surname}"
end

When /^I sign up with no data$/ do
 @user=FactoryGirl.build(:blank_user)
  sign_up
end


Then /^I should see an error message$/ do
page.should have_content "Title can't be blank"
page.should have_content "Name can't be blank"
page.should have_content "Surname can't be blank"
page.should have_content "Email can't be blank"
page.should have_content "Password can't be blank"
page.should have_content "Title is too short (minimum is 3 characters)"
page.should have_content "Name is too short (minimum is 3 characters)"
page.should have_content "Surname is too short (minimum is 3 characters)"
page.should have_content "Sign Up"

end



When /^I sign up with an invalid email$/ do
 @user=FactoryGirl.build(:user)
@user.email = "kob2222@gmailcom"
  sign_up
end

Then /^I should see an invalid email message$/ do
  page.should have_content "Email is invalid"
end

When /^I sign up with too short password$/ do
 @user=FactoryGirl.build(:user)
@user.password = "1234"
@user.password_confirmation = "1234"
  sign_up
end

Then /^I should see too short password message$/ do
  page.should have_content "Password is too short (minimum is 5 characters)"
end

When /^I sign up with mismatched password and confirmation$/ do
 @user=FactoryGirl.build(:user)
@user.password_confirmation = "apka1234"
  sign_up
end

Then /^I should see mismatched password message$/ do
  page.should have_content "Password doesn't match confirmation"
end


Given /^I signed up$/ do
 @user=FactoryGirl.create(:user)
end

Given /^I am not logged$/ do
  log_out
end

When /^I log in with valid credentials$/ do
  log_in
end

Then /^I should see a successful log in message$/ do
  page.should have_content "Logged in!"
end

When /^I return to the site$/ do
  visit '/'
end

Then /^I should be logged in$/ do
  page.should have_content "Logged in as #{@user.title} #{@user.name} #{@user.surname}"

end

When /^I log in with wrong email$/ do

  @user.email ="kob222@gmailcom"
  log_in
end

Then /^I see an invalid log in message$/ do
  page.should have_content "Email or password is invalid"
end

Then /^I should be logged out$/ do
  page.should have_content "Sign Up"
  page.should have_content "Log In"
end

When /^I log in with wrong password$/ do
@user.password = "asffdbd234"
  log_in
end

Given /^I am log in$/ do
  log_in
  page.should have_content "Logged in as #{@user.title} #{@user.name} #{@user.surname}"
end

Given /^I am logged in$/ do
  @user=FactoryGirl.create(:user)
  log_in
  page.should have_content "Logged in as #{@user.title} #{@user.name} #{@user.surname}"
end

When /^I log out$/ do
  visit '/'
  click_link 'Log Out'
end

Then /^I should see a signed out message$/ do
  page.should have_content "Logged out!"
end



When /^I log in with valid credentials and check box remember me$/ do
  visit '/'
  click_link 'Log In'
  fill_in "email", with: @user.email
  fill_in "password", with: @user.password
  check "remember_me"
  click_button "Log In"
end


When /^I log in with valid credentials and uncheck box remember me$/ do
  visit '/'
  click_link 'Log In'
  fill_in "email", with: @user.email
  fill_in "password", with: @user.password
  uncheck "remember_me"
  click_button "Log In"
end

When /^I close the browser$/ do
  expire_cookies
end

Then /^I should be still log in$/ do
  page.should have_content "Logged in as #{@user.title} #{@user.name} #{@user.surname}"
end

Then /^I should see log in page$/ do
  page.should have_content "Log In"
  page.should_not have_content "Logged in as"
end

When /^I request an email with password reset$/ do
  visit login_path
  click_link "Reset password"
  fill_in "email", with:  @user.email
  click_button "Reset Password"
  page.should have_content "Email sent with password reset instructions."
end

Then /^I receive an email with password reset link$/ do
  open_email(@user.email, :with_subject => "Mag Password Reset")
  current_email.default_part_body.to_s.should include("To reset your password click the URL below or copy to your browser.")
  visit_in_email("Reset Password Link")

end

Then /^I choose new password$/ do
  fill_in "user_password", :with => "NewPass12"
  fill_in "user_password_confirmation", :with => "NewPass12"
  click_button "Update Password"
  page.should have_content "Password has been reset."
end

When /^I should log in with new password$/ do
  visit '/'
  click_link 'Log In'
  fill_in "email", :with => @user.email
  fill_in "password", :with => "NewPass12"
  check "remember_me"
  click_button "Log In"
end


