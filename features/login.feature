Feature: Login

  As a registered user
  I want to login in my account
  In order to interact with my projects

  Scenario: Login with valid credentials
    Given I'm already registered
    And I'm on the login page
    And I fill in valid credentials
    And I click on "Sign in"
    Then I should be logged in

  Scenario: Login with invalid credentials
    Given I'm already registered
    And I'm on the login page
    And I fill in invalid credentials
    And I click on "Sign in"
    Then I should see "Sorry, please try again."
