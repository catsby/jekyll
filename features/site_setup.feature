Feature: Site Setup
  As a hacker who likes to blog
  I want to be able to script the setup of a new Jekyll site 
  In order to get the basic structure of a Jekyll site for free

  Scenario: Create a new Jekyll site provided a name 
    Given I set the "new" option to "new_site" 
    When I run jekyll with options
    Then the new_site directory should exist
    # And I should see "Contact: email@me.com" in "_site/contact.html"
