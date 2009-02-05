Feature: Manage products
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new product
    Given I am on the new product page
    When I fill in "Name" with "name 1"
    And I fill in "Price" with "price 1"
    And I press "Create"
    Then I should see "name 1"
    And I should see "price 1"

  Scenario: Delete product
    Given the following products:
      |name|price|
      |name 1|price 1|
      |name 2|price 2|
      |name 3|price 3|
      |name 4|price 4|
    When I delete the 3rd product
    Then I should see the following products:
      |name|price|
      |name 1|price 1|
      |name 2|price 2|
      |name 4|price 4|
