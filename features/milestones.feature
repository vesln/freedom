Feature: Milestones

  In order to organize tasks
  As a project owner
  I want to manage milestones

  Background:
    Given I am logged in
    And I am working on project "Awesomeness"

  Scenario: View all milestones
    Given There are few existing milestones for this project
    And I am on the milestones page
    Then I should see the milestones for the project

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
    Then I should be on the milestones page
    And I should see "Sorry, please try again."

  Scenario: Edit a milestone
    Given There are "milestone" called "v0.1"
    When I am on the milestones page
    And I follow "Edit"
    And I fill in "Name" with "OMG"
    And I press "Save"
    Then I should not see "v0.1"
    And I should see "OMG"

  Scenario: Delete a milestone
    Given There are "milestone" called "OMG OMG"
    When I am on the milestones page
    And I follow "Delete"
    Then I should not see "OMG OMG"
