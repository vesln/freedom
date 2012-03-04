Feature: Login

  As a registered user
  I want to login in my account
  In order to interact with my projects

  Scenario: Login with valid credentials
    Given I am already registered with "example@example.com" and "12356"
    When I am on the login page
    And I fill in "Email" with "example@example.com"
    And I fill in "Password" with "12356"
    And I press "Sign in"
    Then I should be logged in

  Scenario: Login with invalid credentials
    Given I am already registered with "example@example.com" and "12356"
    When I am on the login page
    And I fill in "Email" with "example@example.com"
    And I fill in "Password" with "wrong"
    And I press "Sign in"
    Then I should see "Sorry, please try again."
