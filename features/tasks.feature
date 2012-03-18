Feature: Tasks

  In order to track issues and features for a project
  As a project owner
  I want to manage tasks

  Background:
    Given I am logged in
    And I am working on project "Awesomeness"

  Scenario: Create new task
    Given the milestone "0.1" exist
    And the user "John" exist
    And I am on the tasks page
    And I follow "Create new task"
    And I submit the following task information:
      | state         | new    |
      | title         | Bug 33 |
      | milestone     | 0.1    |
      | assigned_user | John   |
      | description   | Foobar |
    Then I should be on the newly created task page
    And I should see the following task:
      | state         | new    |
      | title         | Bug 33 |
      | milestone     | 0.1    |
      | assigned_user | John   |
      | description   | Foobar |

  Scenario: Task showing
    Given there are "30 completed" tasks
    And there are "10 open" tasks
    When I am on the tasks page
    Then I should see "15" completed tasks and "10" open tasks
