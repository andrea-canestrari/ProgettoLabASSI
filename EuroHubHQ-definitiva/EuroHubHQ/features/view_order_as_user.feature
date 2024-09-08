Feature: View an order to the shop
    As an user
    I want to be able to see my orders
    So that I can track my transactions made into the shop.

Scenario: Admin adds a new order
    Given I have an admin account and a user account
    When I create a new order made by the user
    And I access the user dashboard
    Then I should be able to see my order