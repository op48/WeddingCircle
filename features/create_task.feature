Feature: A user can create a task

Background:
  Given a wedding exists
    And a user exists
    And a user is signed in
    And on their dashboard

#@wip
Scenario: A user creates a task
  When a user chooses to create a task
    And a user fills in the create task form with valid info
    And saves this form
  Then a task should be created 



