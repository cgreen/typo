Feature: Write Articles
  As a blog administrator
  In order to keep the blog well organized
  I want to be able to merge similar articles

  Background:
    Given the blog is set up

  Scenario: Merge is not available to non-admins
    When I am on the edit page for article 1
    Then I should not see "Merge"

  Scenario: Merge is not available on new articles
    When I am logged into the admin panel
    And I follow "New Article"
    Then I should not see "Merge"

  Scenario: Cannot merge with non-existent articles
    When I am logged into the admin panel
    And I am on the edit page for article 1
    And I fill in "merge_with" with "99"
    And I press "Merge"
    Then I should see "Article 99 does not exist."

