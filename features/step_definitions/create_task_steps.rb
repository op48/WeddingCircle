When(/^a user chooses to create a task$/) do
  click_on 'Create Task'
end

Given(/^a user is on create task page$/) do
  visit new_task_path
end

When(/^a user fills in the create task form with valid info$/) do
  fill_in('Wedding', :with => 1)
  fill_in('Title', :with => "Meet Photograher")
  fill_in('Task details', :with => "Discuss dates and prices")
  within "#task_date_time_due_3i" do
    select '10' 
  end
  within "#task_date_time_due_2i" do
    select 'December'
  end
  within "#task_date_time_due_1i" do
    select '2014'
  end
  within "#task_date_time_due_4i" do
    select '10'
  end
  within "#task_date_time_due_5i" do
    select '30'
  end
end

When(/^saves this form$/) do
  click_on "Save"
end

Then(/^a task should be created$/) do
  expect(Task.count).to eq(1)
end