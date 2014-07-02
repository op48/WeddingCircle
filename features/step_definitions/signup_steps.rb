Given(/^that a user is on the signup page$/) do
  visit new_user_registration_path
end

When(/^a user completes the form with valid information$/) do
  @email = Faker::Internet.email
  fill_in 'Email', :with => @email
  fill_in 'Password', :with => "password"
  fill_in 'Password confirmation', :with => "password"
end

When(/^chooses "(.*?)" as their role$/) do |role|
  within "#user_type" do
    select role
  end 
end

When(/^signs up$/) do
  click_button "Sign up"
end

Then(/^a "(.*?)" account should be created$/) do |arg1|
  visit new_user_session_path
end

Then(/^their type "(.*?)" recorded$/) do |bride|
  User.first.type == bride
end