Feature: Admin Registration and Authentication

Scenario: Admin registers an account and signs in
    Given I visit the admin sign up page
    When I fill in the registration form with valid information
    And I sign up
    Then I should be successfully logged in