Feature: Account management

  As a registered user
  I should be able to change my profile information
  In order to keep everything up to date

  Scenario: Edit profile
    Given I am logged in with "example@example.com"
    When I am on the dashboard page
    And I follow "Edit profile"
    And I should see "Account Settings"
    When I fill in "Password" with "example123"
    And I fill in "Password confirmation" with "example123"
    And I click on "Save"
    Then I should be to login with "example@example.com" and "example123"

  Scenario: Edit profile with blank password
    Given I am registered as "example@example.com" and "123456"
    Given I am logged in with "example@example.com"
    When I am on the dashboard page
    And I follow "Edit profile"
    And I should see "Account Settings"
    And I click on "Save"
    Then I should be to login with "example@example.com" and "123456"
