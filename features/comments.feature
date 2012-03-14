Feature: Comments

  In order to complete the task as expected
  As a project colaborator
  I want to add comments to tasks

  Background:
    Given I am logged in
    And I am working on project "Awesomness"

  Scenario: Add comment to a task
    Given The task "Bug #33" exists
    When I am on the task page
    And I fill in comment "Ok, this is easy."
    Then I should see the comment "Ok, this is easy."
