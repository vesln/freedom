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

  Scenario: View tasks count
    Given There are one milestone and "3" completed tasks from "10"
    And I am on the milestones page
    Then I should see the "3 from 10"

  Scenario: Create a new milestone
    Given I am on the milestones page
    When I follow "New milestone"
    And I create a new milestone with name "1.0"
    Then there should be a milestone "1.0"

  Scenario: Create a new milestone with invalid data
    Given I am on the milestones page
    When I follow "New milestone"
    And I try to create a milestone with invalid data
    Then the milestone should not exist

  Scenario: Edit a milestone
    Given There are milestone "0.1"
    When I am on the milestones page
    And I edit the milestone "0.1"
    And I rename the milestone from "0.1" to "0.2"
    Then the milestone should be renamed from "0.1" to "0.2"

  Scenario: Delete a milestone
    Given There are milestone "0.1"
    When I am on the milestones page
    And I delete the milestone "0.1"
    Then the milestone "0.1" should be deleted
