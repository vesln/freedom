Feature: Milestones

  As a project owner
  I want to create milestones
  In oreder to organize tasks.

  Scenario: List all milestones
    Given There are "milestone" called "1.0 beta"
    And I am on the milestones page
    Then I should see "1.0 beta"

  Scenario: Create a new milestone
    Given I am on the milestones page
    When I follow "New milestone"
    And I fill in "Name" with "1.0 alpha"
    And I press "Save"
    Then I should see "1.0 alpha"

  Scenario: Create a new milestone with invalid data
    Given I am on the milestones page
    When I follow "New milestone"
    And I press "Save"
    Then I should see "Sorry, please try again."
