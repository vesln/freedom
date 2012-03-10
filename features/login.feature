Feature: Login

  In order to interact with my projects
  As a user
  I want a secure access to them

  Background:
    Given I am already registered with "example@example.com" and "123456"

  Scenario: Login with valid credentials
    Given I am on the login page
    And I enter valid login credentials "example@example.com" and "123456"
    Then I should be logged in

  Scenario: Login with invalid credentials
    Given I am on the login page
    And I enter invalid password for "example@example.com"
    Then I should see "Sorry, please try again."
