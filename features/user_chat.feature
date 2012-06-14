Feature: Chat
  In order to discuss the subject with others
  As a user
  I should be able view and send messages

  Scenario: User should only be prompted for their name once
    Given I sign in
    When I visit a discussion page
    Then I should be prompted for my name
    When I submit my name and return to the discussion page
    Then I should not be prompted for my name

  Scenario: User should not be able to post without submitting their name
    Given I sign in
    When I visit a discussion page
    Then I should not be able to post a message
    When I submit my name and return to the discussion page
    Then I should be able to post a message

  @javascript
  Scenario: User sends a message
    Given I visit a discussion page and enter my name
    When I post the message "hello world!"
    Then I should see "hello world!" in the chat box
    When Another person posts the message "foo bar"
    Then I should see "foo bar" in the chat box
