Feature: Logout

  As a logged in user
  I want to logout from my account
  In order to eliminate any exposure

  Scenario: Logout
    Given I'm logged in
    And I'm on the dashboard page
    And I click on "Logout"
    Then I should see "Successful logout"
