Feature: Projects

  In order to organize tasks by projects
  As a project owner
  I want to manage projects

  Background:
    Given I am logged in

  Scenario: View all projects
    Given There are few existing projects
    And I am on the projects page
    Then I should see the projects

  Scenario: Create a new project
    Given I am on the projects page
    When I follow "New project"
    Then I create a new project with name "Project 1"
    Then there should be a project "Project 1"

  Scenario: Save a project with invalid data
    Given I am on the projects page
    And I follow "New project"
    And I try to create a new project with invalid data
    Then the project should not exist

  Scenario: Edit a project
    Given There are project "Project 1"
    When I am on the projects page
    And I edit the project "Project 1"
    And I rename the project to "Project 2"
    Then the project should be renamed from "Project 1" to "Project 2"

  Scenario: Delete a project
    Given There are project "Project 1"
    When I am on the projects page
    And I delete the project "Project 1"
    Then the project "0.1" should be deleted
