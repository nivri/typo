Feature: Merge Articles
  As a blog administrator
  In order to eliminate duplicate content
  I want to be able to merge articles in my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And I am on the new article page
    And I fill in "article_title" with "Admin article"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum for Admin article"
    And I press "Publish"
    And I follow "Log out"
    And I am logged as a blogger
    And I am on the new article page
    And I fill in "article_title" with "User article"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum for User article"
    And I press "Publish"
    And I follow "Log out"
    
  Scenario: Admin can merge articles
    When I am logged into the admin panel
    And I am on the new article page
    Then I should see "Merge Articles"
    
  Scenario: User can not merge articles
    When I am logged as a blogger
    And I am on the new article page
    Then I should not see "Merge Articles"
    
  Scenario: Merge to article is updated and merge from article is deleted
    Given there are some articles
    When I am logged into the admin panel
    And I am on the articles page
    And I follow "Article 1"
    And I fill in "merge_with" with "6"
    And I press "Merge"
    Then I should see "Article 1"
    And I should not see "Article 2"
  
  Scenario: Merge from article content is in merge to article content 
    Given there are some articles
    When I am logged into the admin panel
    And I am on the articles page
    And I follow "Article 1"
    And I should not see "Article No 2"
    And I fill in "merge_with" with "6"
    And I press "Merge"
    And I follow "Article 1"
    Then I should see "Article No 1"
    And I should see "Article No 2"