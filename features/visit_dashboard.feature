Feature: Visit dashboard
  In order to create discussions and view past discussions
  As a user
  I should be able visit the dashboard

  Scenario: Guest visits the dashboard
    When I visit the dashboard
    Then I should be directed to sign in

  Scenario: User visits the dashboard
    Given I sign in
    When I visit the dashboard
    Then I should be on the dashboard page
