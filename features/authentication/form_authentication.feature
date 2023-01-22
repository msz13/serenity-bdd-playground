Feature: Form-Based Authentication

  In order to learn how to use Serenity/JS with Cucumber and WebdriverIO
  As a Curious Developer
  I'd like to see an example

  Background:
    Given Alice starts with the "Form Authentication" example

  Scenario: Using username and password to log in
    Given Alice starts with the "Form Authentication" example
    When she logs in using "<username>" and "<password>"
    Then she should see that authentication has <outcome>

    Examples:
      | username | password             | outcome   |
      | tomsmith | SuperSecretPassword! | succeeded |
      | foobar   | barfoo               | failed    |
