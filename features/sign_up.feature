Feature: Sign up user

Background: 
    Given that a user is on the signup page

Scenario:
  When a user completes the form with valid information
    And chooses "Bride" as their role
    And signs up
  Then a "Bride" account should be created
    And their type "Bride" recorded
  