Feature: Adding a category to the shop
    As an admin
    I want to be able to create a category for my shop
    So that I can organize my items registered into the shop

    Scenario: Admin adds a category to the shop
        Given I am a logged-in admin
        When I visit the category page 
        And I create a new category
        And I fill the form with valid information
        And I confirm the info
        Then I should be able to add a new category