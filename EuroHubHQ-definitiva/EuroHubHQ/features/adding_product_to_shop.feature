Feature: Adding a product to the shop
    As an admin
    I want to be able to create a product for my shop
    So that I can add more items into the shop

Scenario: Admin adds a product to the shop
    Given I am an administrator
    When I create a new category item
    And I create a new product 
    And I add new stocks to the product
    Then I should be able to add a new product.