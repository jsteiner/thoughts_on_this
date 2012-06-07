Feature: Visit the homepage
  In order to make an informed descision about signing up
  As a guest
  I should be able to read information about the site

  Scenario: Guest visits the homepage
    When I view the homepage
    Then I should be able to read about the application
    And I should be able to sign in or sign up

  Scenario: User visits the homepage
    Given I sign in
    Then I should be on the dashboard page
    When I view the homepage
    Then I should be redirected to my dashboard
