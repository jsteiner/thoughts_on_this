Feature: Discussion
  In order to discuss the subject with others
  As a guest
  I should be able view and send messages

  Scenario: Guest visits the discussion
    Given I visit a discussion page
    Then I should be prompted for my name

  @javascript
  Scenario: Guest sends a message
    Given I visit a discussion page and enter my name
    When I post a message
    Then I should see the message in the chat box
