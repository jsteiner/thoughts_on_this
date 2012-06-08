Feature: Discussion
  In order to discuss the subject with others
  As a user
  I should be able view and send messages

  Scenario: User should only be prompted for their name once
    Given I sign in
    And I visit a discussion page
    Then I should be prompted for my name
    When I submit my name and return to the discussion page
    Then I should not be prompted for my name

  @javascript
  Scenario: User sends a message
    Given I have created a discussion
    When I post a message
    Then I should see the message in the chat box
