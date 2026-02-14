@local @local_wb_news
Feature: News: Testing Email Functionality

  Background:
    Given an email catcher server is configured

  ## @javascript
  Scenario: News: Verifying email content to user
    When the following emails have been sent:
      | to                   | subject           | message                |
      | student1@example.com | A testing subject | This is a test message |
    Then the email to "student1@example.com" with subject containing "A testing subject" should contain "This is a test message"
    ## And I wait "11" seconds

  Scenario: News: Test emptying the email inbox
    When I empty the email inbox
    And the following emails have been sent:
      | to                   | subject   |
      | student1@example.com | Apple     |
      | student1@example.com | Banana    |
      | student1@example.com | Chocolate |
    Then user "student1@example.com" should have 3 emails
    And I empty the email inbox
    And user "student1@example.com" should have 0 emails