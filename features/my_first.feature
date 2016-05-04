Feature: My First Feature

  Scenario: My First Scenario
    When I navigate to "http://puppies.herokuapp.com"
    And I click the button "View Details"
    And I click the button "Adopt Me!"
    And I click the button "Complete the Adoption"
    And I fill the adoption form
    And I click the button "Place Order"
    Then I should see "Thank you for adopting a puppy!"
