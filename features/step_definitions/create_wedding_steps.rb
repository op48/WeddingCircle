Given(/^a user exists$/) do
  User.create!(
    :first_name => Faker::Name.first_name,
    :last_name => Faker::Name.last_name,
    :email => Faker::Internet.email,
    :password => "password"
  )
end

Given(/^user is signed in$/) do
  visit new_user_session_path
end

Given(/^a wedding exists$/) do
  Wedding.create!(
    :title => "bob&sharons",
    :wedding_date => "05 Dec 2014"
    )
end

Given(/^on the edit wedding page$/) do
  visit edit_wedding_path
end

When(/^a user completes the form with valid info$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^selects a role "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^a wedding should should be created$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^their role should be recorded$/) do
  pending # express the regexp above with the code you wish you had
end
