Given(/^on their dashboard$/) do
  visit user_path
end

When(/^a user chooses to create a wedding$/) do
  click_on 'Create Wedding'
end

When(/^they fill in the create wedding form with valid info$/) do
  fill_in("Title", :with => "Joe and Sally's Wedding")
  within "#wedding_wedding_date_3i" do
    select '17' 
  end
  within "#wedding_wedding_date_2i" do
    select 'December'
  end
  within "#wedding_wedding_date_1i" do
    select '2014'
  end
  fill_in("Create Role", :with => "Bride")
  fill_in("Role Description", :with => "Main Organiser, bride to be")
end

When(/^they submit "(.*?)"$/) do |save|
  click_on save
end

Then(/^they should have a wedding saved$/) do
  Wedding.first.title == "Joe and Sally's Wedding"
end