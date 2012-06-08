Feature: Upload images
  In order to discuss images with others
  As a user
  I should be able upload my images to the site

  Scenario: User uploads an image
    Given I sign in
    When I upload an image with a name
    Then I should see the image and name on the page
    When I visit the dashboard
    Then I should see the discussion in my list of discussions
