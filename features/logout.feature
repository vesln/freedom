Feature: Logout

  As a logged in user
  I want to logout from my account
  In order to eliminate any exposure

  Scenario: Logout
    Given I am logged in
    And I am on the dashboard page
    And I click on "Logout"
    Then I should see "Successful logout"
