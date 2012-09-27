@feeds
Feature: Feeds
  In order to have feeds on my website
  As an administrator
  I want to manage feeds

  Background:
    Given I am a logged in refinery user
    And I have no feeds

  @feeds-list @list
  Scenario: Feeds List
   Given I have feeds titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of feeds
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @feeds-valid @valid
  Scenario: Create Valid Feed
    When I go to the list of feeds
    And I follow "Add New Feed"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 feed

  @feeds-invalid @invalid
  Scenario: Create Invalid Feed (without name)
    When I go to the list of feeds
    And I follow "Add New Feed"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 feeds

  @feeds-edit @edit
  Scenario: Edit Existing Feed
    Given I have feeds titled "A name"
    When I go to the list of feeds
    And I follow "Edit this feed" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of feeds
    And I should not see "A name"

  @feeds-duplicate @duplicate
  Scenario: Create Duplicate Feed
    Given I only have feeds titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of feeds
    And I follow "Add New Feed"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 feeds

  @feeds-delete @delete
  Scenario: Delete Feed
    Given I only have feeds titled UniqueTitleOne
    When I go to the list of feeds
    And I follow "Remove this feed forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 feeds
 