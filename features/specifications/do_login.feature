Feature: Do a login on automationpractice

    I want to perform a login on automationpractice

    Scenario Outline: Login
        Given I am on automationpractice homepage
        And I do a login with "<username>" and "<password>"
        Then I should be able to see my account page

        Examples:
            | username                 | password |
            | test.automation@test.com | 123456   |
