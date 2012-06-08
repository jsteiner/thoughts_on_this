Feature: Chat
  In order to discuss the subject others
  As a user or guest
  I should be able view and send messages

  Scenario: User sends a message
    Given I have created a discussion
    When I post a message
    Then I should see the message in the chat box
