Feature: A user edits a wedding

Background:
  Given a user exists
    And user is signed in  
    And a wedding exists
    And user is on the edit wedding page  

Scenario: A user edits a wedding
  When a user completes the form with valid info
    And a user submits the form
  Then a wedding should be updated
   






