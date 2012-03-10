Feature: Account management

  In order to keep everything up to date
  As a registered user
  I should be able to change my profile information

  Scenario: Edit profile
    Given I am logged in
    And I am on the dashboard page
    And I follow "Edit profile"
    When I change my password to "example123"
    Then I should be able to login with my new password "example123"

  Scenario: Edit profile with blank password
    Given I am logged in
    When I am on the dashboard page
    And I follow "Edit profile"
    And I click on "Save"
    Then I should be to login with my old password
