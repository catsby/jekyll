Feature: Site Setup
  As a hacker who likes to blog
  I want to be able to script the setup of a new Jekyll site 
  In order to get the basic structure of a Jekyll site for free

  Scenario: Create a new Jekyll site provided a name 
    Given I set the "init" option to "new_site" 
    When I run jekyll with options
    Then the new_site directory should exist
    And I should see "auto: false" in "new_site/_config.yml"
    And the new_site/_layouts directory should exist
    And the new_site/_posts directory should exist
    And the "new_site/index.md" file should exist
    And the "new_site/_layouts/default.html" file should exist
