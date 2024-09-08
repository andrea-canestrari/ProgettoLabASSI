Feature: User Registration and Authentication

Scenario: User registers an account and signs in
    Given I visit the user sign up page
    When I enter the valid information into the form
    And I try to sign up
    Then I should be successfully logged into the user home