Feature: Simple search in google

    I want to perform a simple search in google

    Scenario Outline: Perform a simple search
        Given I am on google home page
        And I do a search for "<search_info>"
        Then I should be able to see the response page

        Examples:
            | search_info   |
            | Ruby on Rails |