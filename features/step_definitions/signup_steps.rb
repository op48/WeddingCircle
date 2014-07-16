Given(/^that a user is on the signup page$/) do
  visit new_user_registration_path
end

When(/^a user completes the form with valid information$/) do
  @first_name = "Charlie"
  @last_name = "Brown"
  @email = "charlie@mail.com"
  @password = "password"

  fill_in 'First name', :with => @first_name
  fill_in 'Last name', :with => @last_name
  fill_in 'Email', :with => @email
  fill_in 'Password', :with => @password
  fill_in 'Password confirmation', :with => @password
end

When(/^signs up$/) do
  click_button "Sign up"
end

Then(/^a account should be created$/) do
  expect(User.count).to eq(1)
end

Then(/^user should be on redirected to their dashboard$/) do
  visit user_path 
end


