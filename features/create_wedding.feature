Feature: A user creates a wedding

Background:
  Given a user exists
    And user is signed in  
    And on the edit wedding page  
@wip
Scenario: A user creates a wedding
   When a user completes the form with valid info
   And selects a role "Bride"
  Then a wedding should should be created
    And their role should be recorded






