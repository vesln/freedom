Feature: Registration

  As an unregistered user
  I want to create an account
  In order to manage projects and their tasks

  Scenario: Sign up with valid data
    Given I am on the signup page
    When I fill in the following:
      | Email  | hi@vesln.com|
      | Password | top-secret |
      | Password confirmation | top-secret |
    And I press "Sign up"
    Then I should see "Thank you for your registration!"
    And I should be registered

  Scenario: Sign up with invalid data
    Given I am on the signup page
    When I fill in the following:
      | Email  | hivesln.com|
      | Password | top |
      | Password confirmation | top-secret |
    And I press "Sign up"
    Then I should see "Please, try again."
