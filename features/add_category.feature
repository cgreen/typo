Feature: Add Categories
  As a blog administrator
  In order to categorize my blog entries
  I want to be able to add new categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Create new category
    Given I am on the new category page
    When I fill in "Name" with "Foobar"
    And I fill in "Keywords" with "Lorem Ipsum"
    And I press "Save"
    Then I should be on the new category page
    Then I should see "Foobar"
    And I should see "Lorem Ipsum"
