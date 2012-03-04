Feature: Projects

  As a user who wants to track issues
  I want to create projects
  In order to interact with issues

  Scenario: List all projects
    Given There are a project called "Freedom project"
    And I am on the projects page
    Then I should see "Freedom project"

  Scenario: Create a new project
    Given I am on the projects page
    And I follow "New project"
    And I fill in "Name" with "Freedom project"
    And I fill in "Description" with "Issue tracker"
    And I press "Create"
    Then I should be on the projects page
    And I should see "Freedom project"

  Scenario: Create a new project with invalid data
    Given I am on the projects page
    And I follow "New project"
    And I fill in "Description" with "Issue tracker"
    And I press "Create"
    And I should see "Sorry, please try again."
