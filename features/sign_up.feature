Feature: Sign up user

Background: 
    Given that a user is on the signup page

@wip
Scenario:
  When a user completes the form with valid information
    And chooses "Bride" as their role
  Then a "Bride" account should be created
    And their "type" recorded
  