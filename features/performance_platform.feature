Feature: Performance Platform

  @high
  Scenario: Can visit the Performance Platform homepage
    When I visit "/performance"
    Then I should see "Performance"
    And I should see "Find performance data of government services"

  Scenario: Can visit a Performance Platform dashboard
    When I visit "/performance/register-to-vote"
    Then I should see "Voter registration"
