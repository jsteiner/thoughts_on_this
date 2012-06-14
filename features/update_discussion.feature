Feature: Update Discussions
  In order to fix my work based on other's input
  As a user
  I should be able to update my work

  Scenario: User updates text content
    Given I sign in
    When I upload the text "Hello World"
    Then I should see "Hello World" on the page
    When I update the text to say "Hello Boston"
    Then I should see "Hello Boston" on the page

  Scenario: User updates image content
    Given I sign in
    When I upload the image "original_avatar.jpg"
    Then I should see the image "original_avatar.jpg" on the page
    When I update the image with "new_avatar.jpg"
    Then I should see the image "new_avatar.jpg" on the page
