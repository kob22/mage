
def valid_visitor
  @visitor ||= { :title => 'mgr', :name => "Konrad", :surname => "Ziaja", :email => "kob2222@gmail.com",
    :password => "apka123", :password_confirmation => "apka123" }
end


def blank_visitor
  @visitor ||= { :title => '', :name => "", :surname => "", :email => "",
    :password => "", :password_confirmation => "" }
end


def sign_in
visit '/signup'
click_link 'Sign Up'
fill_in "user_title", :with => @visitor[:title]
fill_in "user_name", :with => @visitor[:name]
fill_in "user_surname", :with => @visitor[:surname]
fill_in "user_email", :with => @visitor[:email]
fill_in "user_password", :with => @visitor[:password]
fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
click_button "Sign Up"

end


def log_out
visit '/logout'
end


def log_in
visit '/'
click_link 'Log In'
fill_in "email", :with => @visitor[:email]
fill_in "password", :with => @visitor[:password]
click_button "Log In"
end


Given /^I am not logged in$/ do
  visit '/logout'
end

When /^I sign up with valid user data$/ do
valid_visitor
sign_in
end

Then /^I should see a successful sign up message$/ do
  page.should have_content "Thank you for signing up!"
  page.should have_content "Logged in as #{@visitor[:title]} #{@visitor[:name]} #{@visitor[:surname]}"
end

When /^I sign up with no data$/ do
  blank_visitor
  sign_in
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
  valid_visitor
@visitor = @visitor.merge(:email => "kob222@gmailcom")
  sign_in
end

Then /^I should see an invalid email message$/ do
  page.should have_content "Email is invalid"
end

When /^I sign up with too short password$/ do
  valid_visitor
@visitor = @visitor.merge(:password => "1234", :password_confirmation => "1234")
  sign_in
end

Then /^I should see too short password message$/ do
  page.should have_content "Password is too short (minimum is 5 characters)"
end

When /^I sign up with mismatched password and confirmation$/ do
  valid_visitor
   @visitor = @visitor.merge(:password_confirmation => "apka12345")
  sign_in
end

Then /^I should see mismatched password message$/ do
  page.should have_content "Password doesn't match confirmation"
end


Given /^I signed up$/ do
  valid_visitor
  sign_in
end

Given /^I am not logged$/ do
  log_out
end

When /^I sign in with valid credentials$/ do
  valid_visitor
  log_in
end

Then /^I should see a successful sign in message$/ do
  page.should have_content "Logged in!"
end

When /^I return to the site$/ do
  visit '/'
end

Then /^I should be signed in$/ do
  page.should have_content "Logged in as #{@visitor[:title]} #{@visitor[:name]} #{@visitor[:surname]}"

end

When /^I sign in with wrong email$/ do
    valid_visitor
@visitor = @visitor.merge(:email => "kob222@gmailcom")
  log_in
end

Then /^I see an invalid login message$/ do
  page.should have_content "Email or password is invalid"
end

Then /^I should be signed out$/ do
  page.should have_content "Sign Up or Log In"
end

When /^I sign in with wrong password$/ do
      valid_visitor
@visitor = @visitor.merge(:password => "asffdbd234")
  log_in
end

Given /^I am logged in$/ do
  valid_visitor
  sign_in
log_out
  log_in
page.should have_content "Logged in!"
end

When /^I sign out$/ do
  visit '/'
  click_link 'Log Out'
end

Then /^I should see a signed out message$/ do
  page.should have_content "Logged out!"
end





