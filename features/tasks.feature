Feature: Tasks

  In order to track issues and features for a project
  As a project owner
  I want to manage tasks

  Background:
    Given I am logged in
    And I am working on project "Awesomeness"

  Scenario: View existing tasks
    Given the following tasks exist:
      | state  | title | milestone | assigned_user |
      | new    | Bug 1 | 0.1       | John          |
      | open   | Bug 2 | 0.1       | John          |
      | hold   | Bug 3 | 0.1       | John          |
      | closed | Bug 4 | 0.1       | John          |
    And I am on the tasks page
    Then I should see the following tasks:
      | state  | title | milestone | assigned_user |
      | new    | Bug 1 | 0.1       | John          |
      | open   | Bug 2 | 0.1       | John          |
      | hold   | Bug 3 | 0.1       | John          |
      | closed | Bug 4 | 0.1       | John          |
