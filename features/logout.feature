Feature: Logout

  In order to eliminate any exposure
  As a user
  I want to logout from my account

  Background:
    Given I am logged in

  Scenario: Logout
    When I am on the dashboard page
    And I click on "Logout"
    Then I should be logged out
