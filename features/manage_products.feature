Feature: Manage products
  In order to [goal]
  [stakeholder]
  wants [behaviour]

  Scenario: Show a product
    Given the following products:
        |id  |name      |price|
        |one |Show Television|12.99|
    And the following comments:
        |name|body         |product_id|
        |Bob |Sounds Great!|one       |
        |Sue |Can't hear it|one       |
    When I go to Product one
    Then I should see "2 comments"
    And I should see "Bob says"
    And I should see "Sounds Great!"
    And I should see "Sue says"
    And I should see "Can't hear it"

  Scenario: Register new product
    Given I am on the new product page
    When I fill in "Name" with "name 1"
    And I fill in "Price" with "5.99"
    And I press "Create"
    Then I should see "name 1"
    And I should see "5.99"

  Scenario: Delete product
    Given the following products:
      |name|price|
      |name 1|1.00|
      |name 2|2.00|
      |name 3|3.00|
      |name 4|4.00|
    When I delete the 3rd product
    Then I should see the following products:
      |name  |price|
      |name 1|$1.00|
      |name 2|$2.00|
      |name 4|$4.00|
