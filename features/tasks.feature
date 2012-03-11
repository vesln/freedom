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
      | open   | Bug 4 | 0.1       | John          |
    And I am on the tasks page
    Then I should see the following tasks:
      | state  | title | milestone | assigned_user |
      | new    | Bug 1 | 0.1       | John          |
      | open   | Bug 2 | 0.1       | John          |
      | hold   | Bug 3 | 0.1       | John          |
      | open   | Bug 4 | 0.1       | John          |

  Scenario: Create new task
    Given the milestone "0.1" exsit
    And the user "John" exsit
    And I am on the tasks page
    And I follow "Create new task"
    And I submit the following task information:
      | state         | new    |
      | title         | Bug 33 |
      | milestone     | 0.1    |
      | assigned_user | John   |
    Then I should be on the newly created task page
    And I should see the following task:
      | state         | new    |
      | title         | Bug 33 |
      | milestone     | 0.1    |
      | assigned_user | John   |
