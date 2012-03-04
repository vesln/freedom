Feature: Login

  As a registered user
  I want to login in my account
  In order to interact with my projects

  Scenario: Login with valid credentials
    Given I am already registered
    And I am on the login page
    And I fill in valid credentials
    And I press "Sign in"
    Then I should be logged in

  Scenario: Login with invalid credentials
    Given I am already registered
    And I am on the login page
    And I fill in invalid credentials
    And I press "Sign in"
    Then I should see "Sorry, please try again."
