Feature: Write Articles
  As a blog administrator
  In order to keep the blog well organized
  I want to be able to merge similar articles

  Background:
    Given the blog is set up
    And the following articles exist
     | title    | body    |
     | Title 20 | Body 20 |
     | Title 21 | Body 21 |

  Scenario: Merge is not available to non-admins
    Given I am on the edit page for "Title 20" 
    Then I should not see "Merge"

  Scenario: Merge is not available on new articles
    Given I am logged into the admin panel
    And I follow "New Article"
    Then I should not see "Merge"

  Scenario: Cannot merge with non-existent articles
    Given I am logged into the admin panel
    And I am on the edit page for "Title 20" 
    And I fill in "merge_with" with "99"
    And I press "Merge"
    Then I should see "Article 99 does not exist."

  Scenario: Merge two existing articles
    Given I am logged into the admin panel
    And I am on the edit page for "Title 20"
    And I fill in "merge_with" with "21"
    And I press "Merge"
    Then the article "Title 20" should have body "Body 20\nBody21"

