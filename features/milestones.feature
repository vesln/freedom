Feature: Milestones

  As a project owner
  I want to create milestones
  In oreder to organize tasks.

  Scenario: List all milestones
    Given There are "milestone" called "1.0 beta"
    And I am on the milestones page
    Then I should see "1.0 beta"
