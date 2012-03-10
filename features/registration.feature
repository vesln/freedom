Feature: Registration

  In order to manage projects and their tasks
  As an unregistered user
  I want to create an account

  Scenario: Sign up with valid data
    Given I am on the signup page
    When I fill in valid account information
    Then I should be registered

  Scenario: Sign up with invalid email
    Given I am on the signup page
    When I fill in account information with invalid email
    Then I should not be registered

  Scenario: Sign up with invalid email
    Given I am on the signup page
    When I fill in account information with invalid password confirmation
    Then I should not be registered
