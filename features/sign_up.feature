Feature: Sign up user

Background: 
    Given that a user is on the signup page

Scenario:
  When a user completes the form with valid information
    And signs up
  Then a account should be created
    And user should be on redirected to their dashboard
  