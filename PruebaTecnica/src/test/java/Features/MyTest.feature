
@Feature
Feature: Reset functionality on login page of Application

  Background: Open the Firefox and launch the application
    Given Open the Firefox and launch the application

    @ValidCredentials
  Scenario: Book a fligth

    When Search for "hats for men"
    And Add first hat to Cart with quantity 2
    And Open cart and assert total price and quantity are correct first product
    And Search for "hats for women"
    And Add first hat to Cart with quantity 1
    And Open cart and assert total price and quantity are correct
    And Change the quantity for item selected at step three from 2 to 1 item in Cart
    Then Assert total price and quantiy are changed correctly

