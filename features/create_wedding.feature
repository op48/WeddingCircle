Feature: A user can create a wedding

Background:
  Given a user exists
    And a user is signed in
    And on their dashboard
#@wip
Scenario: A user creates a wedding
  When a user chooses to create a wedding
    And they fill in the create wedding form with valid info
    And they submit "Save"
  Then they should have a wedding saved  

