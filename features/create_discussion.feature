Feature: Create Discussions
  In order to discuss my work with others
  As a user
  I should be able upload my work to the site

  @javascript
  Scenario: User uploads an image
    Given I sign in
    When I upload an image
    Then I should see the image and title on the page
    When I visit the dashboard
    Then I should see the discussion in my list of discussions

  Scenario: User uploads an invalid filetype
    Given I sign in
    When I upload an invalid image
    Then I should see an error message

  Scenario: User uploads text
    Given I sign in
    When I upload text
    Then I should see the text and title on the page
    And I should see the discussion in my list of discussions

