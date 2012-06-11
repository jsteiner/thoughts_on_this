Feature: Discussion
  In order to discuss the subject with others
  As a guest
  I should be able view and send messages

  Scenario: Guest visits the discussion
    Given I visit a discussion page
    Then I should be prompted for my name
    And I should not be able to post a message

  @javascript
  Scenario: Guest sends a message
    Given I visit a discussion page and enter my name
    When I post the message "hello world!"
    Then I should see "hello world!" in the chat box
