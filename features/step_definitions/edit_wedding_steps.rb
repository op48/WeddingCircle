Given(/^a user exists$/) do
  @email = Faker::Internet.email
  @user = User.create!(
    :first_name => @first_name,
    :last_name => Faker::Name.last_name,
    :email => @email,
    :password => "password"
  )
end

Given(/^user is signed in$/) do
  visit new_user_session_path
  fill_in("Email", :with => @user.email)
  fill_in("Password", :with => "password")
  click_button("Sign in")
end

Given(/^a wedding exists$/) do
  @wedding = Wedding.create!(
    :title => "bob&sharons",
    :wedding_date => "05 Dec 2014"
  )
end

Given(/^user is on the edit wedding page$/) do
  visit edit_wedding_path(@wedding)
end

When(/^a user completes the form with valid info$/) do
  @title = "Bob&Sharon's Wedding"
  
  fill_in 'Title', :with => @title
  within "#wedding_wedding_date_3i" do
    select '17' 
  end
  within "#wedding_wedding_date_2i" do
    select 'December'
  end
  within "#wedding_wedding_date_1i" do
    select '2014'
  end
end

When(/^a user submits the form$/) do
  click_on "Update"
end

Then(/^a wedding should be updated$/) do
  @wedding.reload
  expect(@wedding.title).to eq(@title)
  Wedding.first.wedding_date == "Wed, 17 Dec 2014"
end
